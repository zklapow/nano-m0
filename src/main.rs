#![no_std]
#![no_main]

// pick a panicking behavior
//extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

use core::cell::RefCell;
use core::ops::DerefMut;

use cortex_m::{asm, peripheral::syst::SystClkSource, interrupt::Mutex};
use cortex_m_rt::{entry, exception};

use heapless::spsc::{Queue, Consumer};
use heapless::consts::{U8, U3};

use generic_array::GenericArray;

use stm32f0x0_hal::{
    rcc::ClockSource,
    delay::Delay,
    stm32f0::stm32f0x0,
    gpio::{gpioa, Output, PushPull},
    prelude::*,
};

static LED: Mutex<RefCell<Option<gpioa::PA5<Output<PushPull>>>>> = Mutex::new(RefCell::new(None));
static SYSTICK: Mutex<RefCell<Option<cortex_m::peripheral::SYST>>> = Mutex::new(RefCell::new(None));

static mut QUEUE: Option<Queue<GenericArray<u8, U3>, U8>> = None;

// NOTE: Only access this in the SysTick interrupt
static mut CONSUMER: Option<Consumer<GenericArray<u8, U3>, U8, usize>> = None;

#[entry]
fn main() -> ! {
    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = stm32f0x0::Peripherals::take().unwrap();

    let mut syst = cp.SYST;

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();
    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb);

    let clocks = rcc.cfgr
        .hse(16.mhz())
        .sysclk(48.mhz())
        .freeze(ClockSource::HSE, &mut flash.acr);

    cortex_m::interrupt::free(|cs| {
        let mut led = gpioa.pa5.into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);
        *LED.borrow(cs).borrow_mut() = Some(led);
    });

    unsafe {
        QUEUE = Some(Queue::new());
    }

    unsafe {
        CONSUMER = Some(QUEUE.as_mut().unwrap().split().1);
    }

    unsafe {
        QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[20, 10, 10]));
        QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[5, 10, 10]));
        QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[50, 0, 0]));
        QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[0, 10, 0]));
        QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[0, 0, 10]));
    }

    unsafe {
        syst.cvr.write(1);
    }

    let delay_ns = 100;
    let rvr = (delay_ns) * (clocks.sysclk().0 / 1_000_000);

    syst.set_clock_source(SystClkSource::Core);
    syst.set_reload(rvr);
    syst.enable_counter();
    syst.enable_interrupt();

    cortex_m::interrupt::free(|cs| {
        *SYSTICK.borrow(cs).borrow_mut() = Some(syst);
    });

    loop {
        unsafe {
            QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[20, 10, 10]));
            QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[5, 10, 10]));
            QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[50, 0, 0]));
            QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[0, 10, 0]));
            QUEUE.as_mut().unwrap().split().0.enqueue(GenericArray::clone_from_slice(&[0, 0, 10]));
            for i in 0..1_000_000 {}
        }
    }
}

#[derive(PartialEq, Copy, Clone)]
enum State {
    AwaitHigh,
    AwaitLow,
    AwaitReset,
    SendHigh,
    SendLow,
    StartNextBit,
    EndOfPixel,
    EndOfData,
}

//#[exception]
//fn SysTick() {
#[export_name = "SysTick"]
pub extern "C" fn f990172bsf26k90i() {
    extern crate cortex_m_rt;
    cortex_m_rt::Exception::SysTick;

//    static mut LAST_STATE: State = State::EndOfPixel;
//    static mut CURRENT_PIXEL: Option<GenericArray<u8, U3>> = None;
//    static mut PIXEL_OFFSET: u8 = 0;
    #[allow(non_snake_case)]
    let LAST_STATE: &mut State = unsafe {
        static mut LAST_STATE: State = State::EndOfPixel;
        &mut LAST_STATE
    };
    #[allow(non_snake_case)]
    let CURRENT_PIXEL: &mut Option<GenericArray<u8, U3>> = unsafe {
        static mut CURRENT_PIXEL: Option<GenericArray<u8, U3>> = None;
        &mut CURRENT_PIXEL
    };
    #[allow(non_snake_case)]
    let PIXEL_OFFSET: &mut u8 = unsafe {
        static mut PIXEL_OFFSET: u8 = 0;
        &mut PIXEL_OFFSET
    };

    cortex_m::interrupt::free(|cs| {
        if let Some(ref mut syst) = *SYSTICK.borrow(cs).borrow_mut().deref_mut() {
            //syst.disable_interrupt();
            unsafe { syst.cvr.write(1) };
        }
    });

    let mut bit_val = false;
    let mut state = *LAST_STATE;

    while true {
        if (*PIXEL_OFFSET + 1) / 8 >= 3 {
            state = State::EndOfPixel;
        }

        state = match state {
            State::EndOfPixel => {
                *PIXEL_OFFSET = 0;
                let maybe_pixel = unsafe { CONSUMER.as_mut().unwrap().dequeue() };
                match maybe_pixel {
                    None => State::EndOfData,
                    Some(pixel) => {
                        *CURRENT_PIXEL = Some(pixel);
                        State::StartNextBit
                    }
                }
            }
            State::EndOfData => {
                send_reset();
                State::AwaitReset
            }
            State::StartNextBit => {
                match *CURRENT_PIXEL {
                    Some(ref pixel) => {
                        let arr = *PIXEL_OFFSET / 8;
                        let mask = *PIXEL_OFFSET % 8;

                        bit_val = (pixel[arr as usize] & (1u8 << *PIXEL_OFFSET)) > 0;
                        State::SendHigh
                    }
                    None => {
                        State::EndOfPixel
                    }
                }
            }
            State::SendHigh => {
                send_high(bit_val);
                State::AwaitHigh
            }
            State::SendLow => {
                send_low(bit_val);
                State::AwaitLow
            }
            State::AwaitHigh => {
                State::SendLow
            }
            State::AwaitLow => {
                *PIXEL_OFFSET += 1;
                State::StartNextBit
            }
            State::AwaitReset => {
                State::EndOfPixel
            }
        };

        if state == State::AwaitReset || state == State::AwaitLow || state == State::AwaitHigh {
            break;
        }
    }

    *LAST_STATE = state;

    cortex_m::interrupt::free(|cs| {
        if let Some(ref mut syst) = *SYSTICK.borrow(cs).borrow_mut().deref_mut() {
            syst.enable_interrupt();
        }
    });
}

fn set_out_high() {
    cortex_m::interrupt::free(|cs| {
        if let Some(ref mut led) = *LED.borrow(cs).borrow_mut().deref_mut() {
            led.set_high();
        }
    })
}

fn set_out_low() {
    cortex_m::interrupt::free(|cs| {
        if let Some(ref mut led) = *LED.borrow(cs).borrow_mut().deref_mut() {
            led.set_low();
        }
    })
}

fn send_low(val: bool) {
    set_out_low();

    let rvr = match val {
        true => {
            calc_rvr(0.6f32)
        }
        false => {
            calc_rvr(0.8f32)
        }
    };

    delay_rvr(rvr);
}

fn send_high(val: bool) {
    set_out_high();

    let rvr = match val {
        true => {
            calc_rvr(0.7f32)
        }
        false => {
            calc_rvr(0.35f32)
        }
    };

    delay_rvr(rvr);
}

fn send_reset() {
    set_out_low();
    delay_rvr(calc_rvr(50f32));
    ;
}

fn delay_rvr(rvr: u32) {
    cortex_m::interrupt::free(|cs| {
        if let Some(ref mut syst) = *SYSTICK.borrow(cs).borrow_mut().deref_mut() {
            syst.set_reload(rvr);
        }

//        syst.disable_counter();
//        // Make sure the counter is reset
//        unsafe {
//            syst.cvr.write(1);
//        }

//        syst.enable_counter();
    })
}

fn calc_rvr(ns: f32) -> u32 {
    let rvr = (ns) * ((48_000_000 / 1_000_000) as f32);
    return rvr as u32;
}
