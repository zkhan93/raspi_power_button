# POWER BUTTON for Raspberry Pi

## Hardware Setup

required pin is GPIO PIN 5 in BOAD mode
connect a simple push button, with two ends one with GPIO5 PIN and another with GPIO6 pin.
On button press, it should essentially touch these two pins together and them disconnect them.


## Software Setup

clone the repository to `/home/pi/repos/rpi_power_button`, if you choose to have a different pasth, you have to use the same in following commands and you have to update the same in `power_button.service` file
```bash
git clone <git_url> /home/pi/repos/rpi_power_button
cd /home/pi/repos/rpi_power_button
virtualenv -P python3 vevn
pip install -r requirements.txt
```

create a symlink of this power_button service which start the python script to listen to the GPIO 5 BOARD pin
```bash
sudo ln -s /home/pi/repos/rpi_power_button/power_button.service /etc/systemd/system/power_button.service
```

Enable the new service using systemd
```bash
sudo systemctl enable power_button.service
sudo systemctl daemon-reload
```



