def main():
    N = 15
    R, C = map(int, input().split())
    if R > N//2 + 1:
        R = N - R + 1
    if C > N//2 + 1:
        C = N - C + 1
    if C >= R:
        if R % 2 == 1:
            print("black")
        else:
            print("white")
        return 0
    else:
        if C % 2 == 1:
            print("black")
        else:
            print("white")
    return 0

if __name__ == '__main__':
    main()