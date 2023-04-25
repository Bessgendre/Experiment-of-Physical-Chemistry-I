f = open('萘.txt', 'r+')

n = 5

cnt = 0
for line in f.readlines()[3:]:
    time, temperature = [float(i) for i in line.split()]
    print(f'{time:<8.0f} & {temperature:<8.3f}', end='')
    cnt += 1
    if cnt % n != 0:
        print(' & ', end='')
    else:
        print(' \\\\')

f.close()