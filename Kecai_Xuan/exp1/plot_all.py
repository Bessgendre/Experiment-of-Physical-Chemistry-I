import os
import numpy as np
import matplotlib.pyplot as plt

path = r"/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/senior/Jiming_Zheng/exp1/PB19030732 郑纪鸣 实验一数据"

files = os.listdir(path)

times = []
Ts = []

for the_file in files:
    with open(path+"/"+the_file, "r") as f:
        time = []
        T = []
        for line in f.readlines():
            time.append(int(line.split()[0]))
            T.append(float(line.split()[1]))
        times.append(np.array(time))
        Ts.append(np.array(T))

fig, ax = plt.subplots(4, 2)

for i in range(len(files)):
    ax_this = ax[i%4][i//4]
    ax_this.plot(times[i], Ts[i], label=files[i].split(".")[0])
    ax_this.grid(True)
    ax_this.set_xlabel(r'$t$/s')
    if i in [0, 1, 2, 3]:
        ax_this.set_ylabel(r'$T$/$^\circ$C')
    if i in [2, 6]:
        ax_this.legend(loc=1)
    else:
        ax_this.legend()

n1 = 133
n2 = 200
for i in range(len(files)):
    T_average = np.sum(Ts[i][n1:n2])/(n2-n1)
    t = (np.max(Ts[i][n1:n2]) - np.min(Ts[i][n1:n2])) / 2
    print(f"{files[i]:32s}\t{T_average:.2f}\t{t:.2e}")
    

plt.show()
