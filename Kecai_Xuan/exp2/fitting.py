import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import leastsq

pH = np.array([
    3.19, 3.42, 3.63, 3.81, 4.21, 4.41, 4.61
])

D = np.array([
    0.093, 0.146, 0.204, 0.265, 0.416, 0.491, 0.543
])

D_1 = 0.002
D_2 = 0.685

lg = np.log10((D-D_1)/(D_2-D))

def func(p, x):
    k, b = p
    return k * x + b

def error(p, x, y):
    return func(p, x) - y

p0 = [1, 20]

k_, b_ = leastsq(error, p0, args=(pH, lg))[0]
print(f'y = {k_:.5f} x + {b_:.5f}')
x_ = np.linspace(3, 4.8, 10)
y_ = k_ * x_ + b_

fig, ax = plt.subplots()
ax.scatter(pH, lg, color='red', marker='x')
ax.plot(x_, y_, color='b')
ax.grid(True)

ax.set_xlabel(r'pH')
ax.set_ylabel(r'$\lg\frac{D-D_1}{D_2-D}$')

plt.show()