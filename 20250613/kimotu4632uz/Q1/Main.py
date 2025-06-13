def main():
    n, m, x = map(int, input().split())
    c = []
    a = []
    for i in range(n):
        line = list(map(int, input().split()))
        c.append(line[0])
        a.append(line[1:])

    # 最終的な金額
    result = -1

    # 全ての買い方を試す（2^12 = 4096通りしかないので試せる）
    # 愚直に書くのは大変なので、ビット全探索を使う
    for i in range(2**n):
        # iを2進数に変換して、各ビットが1ならその本を買う
        state = bin(i)[2:].zfill(n)

        # 今回の買い方で得られる理解度とコストを計算
        sum = [0 for _ in range(m)]
        cost = 0
        for j, s in enumerate(state):
            if s == '1':
                for k in range(m):
                    sum[k] += a[j][k]
                cost += c[j]

        # 最小値を更新
        if all(s >= x for s in sum):
            if result == -1 or cost < result:
                result = cost

    print(result)

if __name__ == '__main__':
    main()