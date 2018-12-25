#![no_std]
#![no_main]

#[macro_use]
extern crate nb;
// pick a panicking behavior
extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
//extern crate panic_semihosting;

// logs messages to the host stderr; requires a debugger

use cortex_m::{asm, peripheral::syst::SystClkSource};
use cortex_m_rt::entry;
use rtfm::app;

use stm32f0::stm32f0x0;

use stm32f0xx_hal::{
    delay::Delay,
    gpio::{gpioa, Output, PushPull},
    prelude::*,
    rcc::ClockSource,
    timers,
};

const MAX_DUTY_CYCLE: u32 = 64;

pub enum PulseDirection {
    Up,
    Down
}

#[app(device = stm32f0::stm32f0x0)]
const APP: () = {
    static mut LED0: gpioa::PA0<Output<PushPull>> = ();
    static mut LED1: gpioa::PA1<Output<PushPull>> = ();
    static mut TIMER: timers::Timer<stm32f0x0::TIM16> = ();
    static mut PWM_TIMER: stm32f0x0::TIM3 = ();
    static mut COUNTER: usize = 0;
    static mut DUTY: u32 = 0;
    static mut DIRECTION: PulseDirection = PulseDirection::Up;

    #[init]
    fn init() {
        let dp: stm32f0::stm32f0x0::Peripherals = device;

        let mut rcc: stm32f0xx_hal::rcc::Rcc = dp.RCC.constrain();
        let mut gpioa: gpioa::Parts = dp.GPIOA.split();

        let clocks = rcc.cfgr
            .sysclk(16.mhz())
            .clock_source(ClockSource::HSI)
            .freeze();

        let led = gpioa.pa0.into_push_pull_output();
        let led1 = gpioa.pa1.into_push_pull_output();

        //let mut pwm_out = gpioa.pa6.into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);
        //pwm_out.set_high();
        let pwm_out = gpioa.pa6.into_alternate_af1();

        timers::Timer::<stm32f0x0::TIM3>::tim3en();

        let pwm_timer = dp.TIM3;

        // Set prescaler
        // (i.e. divide clock by 16, 16mhz/8 = 2mhz)
        pwm_timer.psc.write(|w| {
            unsafe {
                w.bits(31)
            }
        });

        // Set period
        pwm_timer.arr.write(|w| {
            unsafe {
                w.bits(MAX_DUTY_CYCLE)
            }
        });

        // Set Duty Cycle
        pwm_timer.ccr1.write(|w| {
            unsafe {
                w.bits(0)
            }
        });

        // Set PWM mode
        pwm_timer.ccmr1_output.write(|w| {
            unsafe {
                w.oc1pe().set_bit();
                w.oc1m().bits(0b00000110)
            }
        });

        // Set normally high
        pwm_timer.ccer.write(|w| {
            w.cc1e().set_bit()
        });

        // Enable output
//        pwm_timer.bdtr.write(|w| {
//            w.moe().set_bit()
//        });

        // Enable counter in center aligned mode
        pwm_timer.cr1.write(|w| {
            unsafe {
                w
                    .cms().bits(0b00000001)
                    .cen().set_bit()
            }
        });

        // Force update generation
        pwm_timer.egr.write(|w| {
            w.ug().set_bit()
        });

        let mut tim16 = timers::Timer::<stm32f0x0::TIM16>::tim16(dp.TIM16, 5.hz(), clocks);

        tim16.listen(timers::Event::TimeOut);

        LED0 = led;
        LED1 = led1;
        TIMER = tim16;
        PWM_TIMER = pwm_timer;
    }

    #[idle]
    fn idle() -> ! {
        loop {}
    }

    #[interrupt(resources = [LED0, LED1, COUNTER, TIMER, PWM_TIMER, DUTY, DIRECTION])]
    fn TIM16() {
        block!(resources.TIMER.wait()).expect("Timer wait failed");

        if *resources.COUNTER % 2 == 0 {
            resources.LED0.toggle();
        } else {
            resources.LED1.toggle();
        }

        let cur_duty: u32 = *resources.DUTY;
        if cur_duty >= MAX_DUTY_CYCLE {
            *resources.DIRECTION = PulseDirection::Down;
        } else if cur_duty <= 0 {
            *resources.DIRECTION = PulseDirection::Up;
        }

        resources.PWM_TIMER.ccr1.write(|w| {
            unsafe {
                w.bits(*resources.DUTY)
            }
        });

        *resources.COUNTER += 1;

        let dir: &mut PulseDirection = resources.DIRECTION;
        match dir {
            PulseDirection::Up => *resources.DUTY += 2,
            PulseDirection::Down => *resources.DUTY -= 2,
        }
    }
};
