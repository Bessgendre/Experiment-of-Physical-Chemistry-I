import os

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
        wavelength_s.append(wavelength)
        absorbancy_s.append(absorbancy)

print(*files)

with open(os.path.abspath('.')+"\\table.txt", "w+") as f:
    for i in range(len(wavelength_s[0])):
        f_string = f"{wavelength_s[0][i]:6.2f}"
        for j in range(len(files)):
            f_string += f" & {absorbancy_s[j][i]:6.3f}"
        f_string += f" \\\\\n"
        # print(f_string)
        f.writelines(f_string)
