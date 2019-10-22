import RPi.GPIO as GPIO
import logging
import os
import time

logging.basicConfig()
logger = logging.getLogger(__name__)

GPIO.setmode(GPIO.BOARD)
GPIO.setup(5, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
	in_state = GPIO.input(5)
	if in_state == False:
		logger.info("Power button pressed")
		os.system('shutdown now')
		break
	else:
		time.sleep(0.5)
