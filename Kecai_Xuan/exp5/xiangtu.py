import numpy as np
import matplotlib.pyplot as plt

T = np.array([
    96.957, 95.286, 92.636, 90.268, 88.674, 87.883,
    87.564, 87.502, 87.406, 87.587, 87.833, 89.255,
    91.890, 94.145, 96.416, 98.893, 99.810,
])

x = np.array([
    0.9992, 1.0000, 0.9913, 0.9563, 0.9049, 0.8408,
    0.7191, 0.7251, 0.6341, 0.5478, 0.3002, 0.1005,
    0.0404, 0.0157, 0.0028, 0.0000, 0.0000,
])

y = np.array([
    0.9992, 0.9765, 0.8998, 0.8207, 0.7769, 0.7438,
    0.7343, 0.7131, 0.6985, 0.6957, 0.6816, 0.6520,
    0.6143, 0.5265, 0.3987, 0.2638, 0.0000,
])

fig, ax = plt.subplots()
ax.plot(x, T, color='blue')
ax.scatter(x, T, marker='x')
ax.plot(y, T, color='red')
ax.scatter(y, T, marker='x')
ax.set_xlabel('x(y)')
ax.set_ylabel('T/$^\circ$C')
ax.grid(True)

plt.show()
