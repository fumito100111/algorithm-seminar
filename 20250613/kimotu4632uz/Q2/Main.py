import bisect

def main():
    n = int(input())
    a = list(map(int, input().split()))
    b = list(map(int, input().split()))
    c = list(map(int, input().split()))

    # aとcはソートしておく
    a.sort()
    c.sort()

    result = 0

    # 中部に注目して、より小さい上部とより大きい下部の数を2分探索で求める
    # その積があるmidでの組み合わせ数になる
    for mid in b:
        # bisect_leftは
        # [1, 2, 2, 3] で2より小さい数の個数 = 1 を返す
        #  o
        top_num = bisect.bisect_left(a, mid)

        # bisect_rightは
        # [1, 2, 2, 3] で2以下の数の個数 = 3 を返す
        #  o  o  o
        # そのうえで全体の数nから引く(より大きい数を数えるため)
        bottom_num = n - bisect.bisect_right(c, mid)

        result += top_num * bottom_num

    print(result)


if __name__ == '__main__':
    main()