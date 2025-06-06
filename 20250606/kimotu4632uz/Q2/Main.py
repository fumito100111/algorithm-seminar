p = 998244353

def pow(x, n):
    result = 1
    for i in reversed(bin(n)[2:]):
        if i == '1':
            result *= x
            result %= p
        x *= x
        x %= p
    return result


def main():
    n, k, m = map(int, input().split())
    result = pow(m, pow(k, n))
    print(result)


if __name__ == '__main__':
    main()