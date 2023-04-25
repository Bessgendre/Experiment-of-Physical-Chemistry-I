import os
import numpy as np
import matplotlib.pyplot as plt

path = r"C:\Users\ZJM\Desktop\wuhuashiyanbaogao\exp2\PB19030732 郑纪鸣 实验2数据"

files = os.listdir(path)
for the_file in files:
    if the_file.split(".")[-1] != "txt":
        files.remove(the_file)

wavelength_s = []
absorbancy_s = []

for the_file in files:
    with open(path+"\\"+the_file, "r") as f:
        wavelength = []
        absorbancy = []
        for line in f.readlines()[1:]:
            nm, Abs = *line.split("\t"),
            wavelength.append(float(nm))
            absorbancy.append(float(Abs))
        wavelength_s.append(np.array(wavelength))
        absorbancy_s.append(np.array(absorbancy))

fig, ax = plt.subplots()

for i in range(len(files)):
    ax.plot(wavelength_s[i], absorbancy_s[i],
            label=files[i].split(".")[0])

ax.legend()
ax.grid(True)
ax.set_xlim(400, 700)
ax.set_ylim(-0.05, 0.8)
ax.set_xlabel(r"波长/nm")
ax.set_ylabel(r"吸光度")

plt.show()
