def main():
    R, C = list(map(int, input().split()))

    str = "black"
    li = [1]*15
    if R >= 9:
        R = 16 - R
    for i in range(int(R)):
        for j in range(i,15-i):
            li[j] *= -1
    if li[C-1] == 1:
        str = "white"
    print(str)
    


    pass

if __name__ == '__main__':
    main()