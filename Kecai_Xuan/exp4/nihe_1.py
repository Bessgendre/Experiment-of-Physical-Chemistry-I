import numpy as np
from numpy.core.function_base import linspace
import scipy as sp
import matplotlib.pyplot as plt
from scipy.optimize import leastsq

# ln p
y_i = np.array([
    11.48, 11.43, 11.37, 11.31, 11.25,
    11.18, 11.10, 11.02, 10.93, 10.83,
])

# 1/T
x_i = np.array([
    0.002839, 0.002853, 0.002868, 0.002885, 0.002902,
    0.002920, 0.002942, 0.002963, 0.002988, 0.003014,
])

def func(p, x):
    k, b = p
    return k * x + b

def error(p, x, y):
    return func(p, x) - y

p0 = [-3000, 20]
Para = leastsq(error, p0, args=(x_i, y_i))

k, b = Para[0]

print(f"k = {k:10f}\nb = {b:10f}")
print(f"cost：{Para[1]}")
print("求解的拟合直线为:")
print(f"y = {k:.5f} x + {b:.2f}")

x = linspace(0.002815, 0.00303, 20)
y = k * x + b

fig, ax = plt.subplots()
ax.plot(x, y, color='blue')
ax.scatter(x_i, y_i, color='red', marker='*')
ax.set_xlabel('1/T')
ax.set_ylabel('ln p')
ax.grid(True)
plt.show()
