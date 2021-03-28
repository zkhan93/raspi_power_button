# POWER BUTTON for Raspberry Pi

## Hardware Setup

Connect a simple push button with two ends, one with GPIO5 PIN and the other with GPIO6 pin.
On button press, it should essentially touch these two pins together and then disconnect them.


## Software Setup

pre-requisites
make sure you have `python3` and `virtualenv` installed
```bash
sudo apt-get install python3
pip install virtualenv
```

clone the repository to `/home/pi/repos/rpi_power_button` (feel free to choose a different path) lets call this `REPO_DIR`,
replace `REPO_DIR` with this path for all the following commands.

There are 2 ways

### Manual way

create python vurtualenv and install dependencies
```bash
cd REPO_DIR
virtualenv -P python3 vevn
pip install -r requirements.txt
```

create a symlink of this power_button service which start the python script to listen to the GPIO 5 BOARD pin
```bash
sudo ln -s REPO_DIR/power_button.service /etc/systemd/system/power_button.service
```

modify `power_button.service` to replace REPO_DIR with the actual repo path.
```bash
# leave the first `REPO_DIR` as is.
sed -i "s+REPO_DIR+REPO_DIR+g" power_button.service
```

Enable the new service using systemd
```bash
sudo systemctl enable power_button.service
sudo systemctl daemon-reload
```

### The Shell Way

run the setup script to do it.
```bash
./setup.sh
```

### OSMC
while adding power button in OSMC following packages were needed
```bash
sudo apt-get install gcc-arm-linux-gnueabihf
```
