import os
import numpy as np
import matplotlib.pyplot as plt

path = r"C:\Users\ZJM\Desktop\wuhuashiyanbaogao\exp1\PB19030732 郑纪鸣 实验一数据"

files = os.listdir(path)

times = []
Ts = []

for the_file in files:
    with open(path+"\\"+the_file, "r") as f:
        time = []
        T = []
        for line in f.readlines():
            time.append(int(line.split()[0]))
            T.append(float(line.split()[1]))
        times.append(np.array(time))
        Ts.append(np.array(T))

for i in range(len(files)):
    fig, ax = plt.subplots()
    ax.plot(times[i], Ts[i])
    ax.grid(True)
    ax.set_xlabel(r'$t$/s')
    ax.set_ylabel(r'$T$/$^\circ$C')
    print(f"Number {i+1}: {files[i]}")

plt.show()
