# Flash

## Materials

* USB-A to USB-C cable.
* Two wires (is better to be male to female header patches).
* A third wire or some tweezers to switch the RST pin with GND.
* Raspberry Pi 3 Model B+ with Raspbian or Raspberry OS.
* ProMicro NRF52840.
* OpenOCD software.
* A solder iron and some stain.

## Sources

* I have followed this blog: https://codensolder.com/blog/rip-swd-programmer . Some things vary to adapt it into the ProMicro device, but its pretty the same procedure.
* Here you can see the schematic of the ProMicro or compatible device pinout: https://nicekeyboards.com/docs/nice-nano/pinout-schematic . We are going to use the SWD and SIO flashing pins.
* Here you can see the Raspberry Pi 3 pinout: https://www.etechnophiles.com/wp-content/uploads/2020/12/R-Pi-3-B-Pinout.jpg . We are going to use the GPIO 24 and 25.
* This is the guide to run into bootloader mode by double-tapping RST with GND: https://nicekeyboards.com/docs/nice-nano/getting-started#flashing-firmware-and-bootloaders

## Wiring

* The DIO pin of the ProMicro will be connected to the GPIO 24 of the Raspberry
* The CLK pin of the ProMicro will be connected to the GPIO 25 of the Raspberry
* The USB-C connector of the ProMicro will be connected to one of the USB-A connectors of the Raspberry. This is needed to power the ProMicro and also share the GND.
* The last cable will double-tap RST with GND to access to the bootloader mode and check that the device and the bootloader is OK.

## Software

You can do as the guy in the blog and compile `openocd` from the sources, but you can instead install it from APT repository:

```bash
sudo apt update && sudo apt install -y openocd
```

## Flash

To flash just connect it all, power the RPI, log in and execute the following command:

```bash
./flash.sh
```

You dont need to put the ProMicro device into the bootloader state before flashing, OpenOCD will to the hard work for you. After flashing, you can double-tap the RST pin with GND and a beautiful `NICENANO` device will shuddenly be mounted!

Before flashing, OpenOCD will not exit, hit `Ctrl + C` to exit.
