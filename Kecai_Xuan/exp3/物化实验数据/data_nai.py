import matplotlib.pyplot as plt
import numpy as np
import scipy as sp
from scipy.optimize import leastsq

plt.rcParams['font.family'] = ['sans-serif']
plt.rcParams['font.sans-serif'] = ['SimHei']

T0 = (27.627 + 27.680) / 2
t0 = 254.5

time = []
T = []
with open("萘.txt", "r") as f:
    for line in f.readlines()[3:]:
        time.append(int(line.split()[0]))
        T.append(float(line.split()[1]))

fig, ax = plt.subplots()
ax.plot(time, T, color='black')
ax.grid(True)
ax.set_xlim(0, 1100)
ax.set_ylim(26.5, 28.75)
ax.set_xlabel(r'时间/s')
ax.set_ylabel(r'温度/$^\circ$C')
ax.hlines(T0, -100, 400, color='blue', linestyles='--')
ax.vlines(t0, 26, 29, color='blue', linestyles='--')

def func(p, x):
    k, b = p
    return k * x + b

def error(p, x, y):
    return func(p, x) - y

p0 = [1, 20]

x_1 = np.array(time[:60])
y_1 = np.array(T[:60])
k_1, b_1 = leastsq(error, p0, args=(x_1, y_1))[0]
print(f'y_1 = {k_1:.5f} x_1 + {b_1:.5f}')
xplot_1 = np.linspace([-100, 400], 100)
yplot_1 = k_1 * xplot_1 + b_1
ax.plot(xplot_1, yplot_1, color='red', linestyle='--')

x_2 = np.array(time[-75:-15])
y_2 = np.array(T[-75:-15])
k_2, b_2 = leastsq(error, p0, args=(x_2, y_2))[0]
print(f'y_2 = {k_2:.5f} x_2 + {b_2:.5f}')
xplot_2 = np.linspace([200, 1400], 100)
yplot_2 = k_2 * xplot_2 + b_2
ax.plot(xplot_2, yplot_2, color='red', linestyle='--')

plt.show()