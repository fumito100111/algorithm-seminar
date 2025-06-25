# テーマ: 「2次元座標系 + 最大公約数」
import math

def gcd(a: int, b: int) -> int:
    a = abs(a) # a の絶対値をとる (意外と気にしてなかった...)
    b = abs(b) # b の絶対値をとる
    if a < b:
        a, b = b, a
    if b == 0:
        return a
    r: int = a % b
    while r != 0:
        a, b = b, r
        r = a % b
    return b


def main():
    N: int = int(input()) # N の値を入力
    COORDINATES: tuple[tuple[int, int], ...] = tuple([tuple(map(int, input().split())) for _ in range(N)]) # 座標を入力 (要素数: N)
    magics: set[tuple[int, int]] = set() # 魔法の座標を格納するセット配列 (重複なし)
    for i in range(N):
        for j in range(i+1, N):
            x1, y1 = COORDINATES[i]
            x2, y2 = COORDINATES[j]
            dx: int = x2 - x1
            dy: int = y2 - y1
            g: int = gcd(dx, dy)
            magic: tuple[int, int] = (int(dx / g), int(dy / g)) # 魔法の座標を計算
            if (int(- dx / g), int(- dy / g)) in magics: # すでに, 反対方向の魔法が存在する場合はスキップ
                continue
            magics.add(magic) # magic をセット配列に追加 (すでに存在する場合は追加されない)

    print(len(magics) * 2) # それぞれの魔法について, 反対方向も必要なので 2 倍する

if __name__ == '__main__':
    main()