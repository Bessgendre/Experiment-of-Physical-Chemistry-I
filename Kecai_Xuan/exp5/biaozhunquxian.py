import numpy as np
import matplotlib.pyplot as plt

omega = np.array([
    0.0000, 0.0997, 0.2010, 0.2999, 0.3984, 0.4989,
    0.5934, 0.7032, 0.7989, 0.8972, 1.0000,
])

n = np.array([
    1.3330, 1.3416, 1.3502, 1.3567, 1.3622, 1.3672,
    1.3714, 1.3759, 1.3792, 1.3818, 1.3831,
])

x = np.linspace(0, 1, 100)
y = -0.037336148 * x**2 + 0.0870011161 * x + 1.33344524

fig, ax = plt.subplots()
ax.plot(x, y, color='blue')
ax.scatter(omega, n, color='red', marker='*')
ax.set_xlabel('正丙醇质量分数/%')
ax.set_ylabel('折光率')
ax.grid(True)
plt.show()
