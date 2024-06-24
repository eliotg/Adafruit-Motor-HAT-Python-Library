import time
import board
from adafruit_motorkit import MotorKit
from adafruit_motor import stepper

kit = MotorKit(i2c=board.I2C())

for i in range(1100):
    kit.stepper1.onestep(direction=stepper.BACKWARD, style=stepper.INTERLEAVE)
    time.sleep(0.01)

kit.stepper1.release()
