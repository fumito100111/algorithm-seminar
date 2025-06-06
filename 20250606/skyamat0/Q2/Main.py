def main():
    N, K, M = map(int, input().split())
    p = 998244353

    if M % p == 0:
        print(0)
    else:
        # 繰り返し二乗法による計算
        r = pow(K, N, p-1)
        # フェルマーの小定理＋繰り返し二乗法による計算
        ans = pow(M, r, p)
        print(ans)

if __name__ == '__main__':
    main()