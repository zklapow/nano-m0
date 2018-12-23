#![no_std]
#![no_main]

#[macro_use]
extern crate nb;
// pick a panicking behavior
//extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
extern crate panic_semihosting;

// logs messages to the host stderr; requires a debugger

use cortex_m::{asm, peripheral::syst::SystClkSource};
use cortex_m_rt::entry;
use rtfm::app;

use stm32f0x0_hal::{
    delay::Delay,
    gpio::{gpioa, Output, PushPull},
    prelude::*,
    rcc::ClockSource,
    stm32f0::stm32f0x0,
    timer,
};

#[app(device = stm32f0::stm32f0x0)]
const APP: () = {
    static mut LED0: gpioa::PA0<Output<PushPull>> = ();
    static mut LED1: gpioa::PA1<Output<PushPull>> = ();
    static mut TIMER: timer::Timer<stm32f0x0::TIM16> = ();
    static mut COUNTER: usize = 0;

    #[init]
    fn init() {
        let dp: stm32f0::stm32f0x0::Peripherals = device;

        let mut flash = dp.FLASH.constrain();
        let mut rcc: stm32f0x0_hal::rcc::Rcc = dp.RCC.constrain();
        let mut gpioa: gpioa::Parts = dp.GPIOA.split(&mut rcc.ahb);

        let clocks = rcc.cfgr
            .sysclk(16.mhz())
            .freeze(ClockSource::HSI, &mut flash.acr);

        let led = gpioa.pa0.into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);
        let led1 = gpioa.pa1.into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);

        let pwm_out = gpioa.pa6.into_af1(&mut gpioa.moder, &mut gpioa.afrl);

        timer::Timer::<stm32f0x0::TIM3>::tim3en(&mut rcc.apb1);

        // Set prescaler
        // (i.e. divide clock by 16, 16mhz/16 = 1mhz)
        dp.TIM3.psc.write(|w| {
            unsafe {
                w.bits(15)
            }
        });

        // Set period
        dp.TIM3.arr.write(|w| {
            unsafe {
                w.bits(8)
            }
        });

        // Set Duty Cycle
        dp.TIM3.ccr1.write(|w| {
            unsafe {
                w.bits(2)
            }
        });

        // Set PWM mode
        dp.TIM3.ccmr1_output.write(|w| {
            unsafe {
                w.oc1pe().set_bit();
                w.oc1m().bits(0b00000110)
            }
        });

        // Set normally high
        dp.TIM3.ccer.write(|w| {
            w.cc1e().set_bit()
        });

        // Enable output
//        dp.TIM3.bdtr.write(|w| {
//            w.moe().set_bit()
//        });

        // Enable counter in center aligned mode
        dp.TIM3.cr1.write(|w| {
            unsafe {
                w
                    .cms().bits(0b00000001)
                    .cen().set_bit()
            }
        });

        // Force update generation
        dp.TIM3.egr.write(|w| {
            w.ug().set_bit()
        });

        let mut tim16 = timer::Timer::<stm32f0x0::TIM16>::tim16(dp.TIM16, 5.hz(), clocks, &mut rcc.apb2);

        tim16.listen(timer::Event::TimeOut);

        LED0 = led;
        LED1 = led1;
        TIMER = tim16;
    }

    #[idle]
    fn idle() -> ! {
        loop {}
    }

    #[interrupt(resources = [LED0, LED1, COUNTER, TIMER])]
    fn TIM16() {
        block!(resources.TIMER.wait()).expect("Timer wait failed");

        if *resources.COUNTER % 2 == 0 {
            resources.LED0.toggle();
        } else {
            resources.LED1.toggle();
        }

        *resources.COUNTER += 1;
    }
};
