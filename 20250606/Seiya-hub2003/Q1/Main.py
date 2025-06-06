def main():
    import math
    x, n = list(map(int, input().split()))
    result = 1
    k = math.log(n, 2)+1
    print(k)
    for i in range(int(k)):
        if (n>>i) & 0b1== 1:
            result *= x
        x *= x
    print(result % 10000000)


if __name__ == '__main__':
    main()