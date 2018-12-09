target extended-remote /dev/cu.usbmodemC1E3AAC1

monitor tpwr enable
monitor swdp_scan
set mem inaccessible-by-default off
attach 1

#file target/thumbv6m-none-eabi/debug/examples/usb
