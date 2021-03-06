#![no_main]
#![no_std]

#[allow(unused)]
use panic_semihosting;

use stm32f0xx_hal as hal;

use crate::hal::{delay::Delay, prelude::*, stm32};

use cortex_m::peripheral::Peripherals;
use cortex_m_rt::entry;

#[entry]
fn main() -> ! {
    if let (Some(mut p), Some(cp)) = (stm32::Peripherals::take(), Peripherals::take()) {
        cortex_m::interrupt::free(move |cs| {
            let mut rcc = p.RCC.configure().sysclk(32.mhz()).freeze(&mut p.FLASH);

            let gpioa = p.GPIOA.split(&mut rcc);
            let gpiob = p.GPIOB.split(&mut rcc);

            // (Re-)configure PA1 as output
            let led1 = gpioa.pa1.into_push_pull_output(cs);

            // (Re-)configure PB1 as output
            let led2 = gpioa.pa0.into_push_pull_output(cs);

            // Get delay provider
            let mut delay = Delay::new(cp.SYST, &rcc);

            // Store them together after erasing the type
            let mut leds = [led1.downgrade(), led2.downgrade()];
            loop {
                for l in &mut leds {
                    l.set_high();
                }
                delay.delay_ms(1_000_u16);

                for l in &mut leds {
                    l.set_low();
                }
                delay.delay_ms(1_000_u16);
            }
        });
    }

    loop {
        continue;
    }
}
