# POWER BUTTON for Raspberry Pi

## Hardware Setup

required pin is GPIO PIN 5 in BOAD mode
connect a simple push button, with two ends one with GPIO5 PIN and another with GPIO6 pin.
On button press, it should essentially touch these two pins together and them disconnect them.


## Software Setup

Run the following command

clone the repository to `/home/pi/raspi_power_button`
```bash
git clone <git_url> /home/pi/raspi_power_button
```
create a symlink of this power_button service which start the python script to listen to the GPIO 5 BOARD pin
```bash
sudo ln -s /home/pi/raspi_power_button/power_button.service /etc/systemd/system/power_button.service
```

Enable the new service using systemd
```bash
sudo systemctl enable power_button.service
sudo systemctl daemon-reload
```


