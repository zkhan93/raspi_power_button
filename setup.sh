#/bin/bash
REPO_DIR=$PWD

sudo apt-get install gcc python3-dev python3-setuptools python3-pip
python3 -m pip install virtualenv

echo Creating virtual environment from python3
/home/${USER}/.local/bin/virtualenv -p python3 $PWD/venv

$REPO_DIR/venv/bin/pip install -r $REPO_DIR/requirements.txt
sed -i "s+REPO_DIR+${REPO_DIR}+g" $REPO_DIR/power_button.service
sudo ln -s $REPO_DIR/power_button.service /etc/systemd/system/power_button.service
sudo systemctl enable power_button.service
sudo systemctl daemon-reload
echo done



