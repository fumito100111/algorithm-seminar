def main():
    x, n = map(int, input().split())

    result = 1
    for i in reversed(bin(n)[2:]):
        if i == '1':
            result *= x
            result %= 10000000
        x *= x
        x %= 10000000
    print(result)


if __name__ == '__main__':
    main()