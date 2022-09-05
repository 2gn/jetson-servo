import board
import digialio
import busio

print("Hello blinka!")

pin = digitalio.DigitalInOut(board.D4)
print("Digital IO ok!")

i2c = busio.I2C(board.SCL, board.SDA)
print("I2C 1 ok!")

i2c = busio.I2C(board.SCL_1, board.SDA_1)
print("I2C 2 ok!")

print("Done!")