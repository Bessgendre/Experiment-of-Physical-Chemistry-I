import numpy as np
from numpy.core.function_base import linspace
import scipy as sp
import matplotlib.pyplot as plt
from scipy.optimize import leastsq

Hg_i = np.array([
    391.2, 352.9, 318.9, 277.1, 235.1,
    196.6, 157.4, 120.6,  80.8,  38.5,
])

p_i = np.array([
    -387.2, -349.4, -316.1, -274.4, -232.1,
    -194.5, -156.0, -119.2, - 78.3, - 37.9,
])

def func(p, x):
    k, b = p
    return k * x + b

def error(p, x, y):
    return func(p, x) - y

p0 = [-1, 0.5]
Para = leastsq(error, p0, args=(Hg_i, p_i))

k, b = Para[0]

print(f"k = {k:10f}\nb = {b:10f}")
print(f"cost：{Para[1]}")
print("求解的拟合直线为:")
print(f"y = {k:.5f} x + {b:.2f}")

x = linspace(0, 400, 100)
y = k * x + b

fig, ax = plt.subplots()
ax.plot(x, y, color='blue')
ax.scatter(Hg_i, p_i, color='red', marker='*')
ax.set_xlabel('真空测压仪示数/mmHg')
ax.set_ylabel('汞压力计示数/mmHg')
ax.grid(True)
plt.show()
