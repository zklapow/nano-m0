#![no_std]
#![no_main]

// pick a panicking behavior
extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
// extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

use cortex_m::{asm, peripheral::syst::SystClkSource};
use cortex_m_rt::entry;

use stm32f0x0_hal::{
    delay::Delay,
    stm32f0::stm32f0x0,
    prelude::*
};

#[entry]
fn main() -> ! {
    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = stm32f0x0::Peripherals::take().unwrap();

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();
    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb);

    let clocks = rcc.cfgr.freeze(&mut flash.acr);

    rcc.cfgr.sysclk()

    let mut led = gpioa.pa5.into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);

    let mut delay = Delay::new(cp.SYST, clocks);
    loop {
        led.toggle();
        delay.delay_ms(1000u32);
        led.toggle();
        delay.delay_ms(1000u32);
    }
}
