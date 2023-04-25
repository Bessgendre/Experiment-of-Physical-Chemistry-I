
# 打开目标文件
f = open('苯甲酸.txt', 'r+')

# 每行输出 n 组
n = 5

cnt = 0
# f.readlines()[x:] 从第 x+1 行开始读取
for line in f.readlines()[3:]:
    time, temperature = [float(i) for i in line.split()]
    print(f'{time:<8.0f} & {temperature:<8.3f}', end='')
    cnt += 1
    if cnt % n != 0:
        print(' & ', end='')
    else:
        print(' \\\\')
if cnt % n != 0:
    print(' \\\\')

f.close()