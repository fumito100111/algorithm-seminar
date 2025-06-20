# テーマ: 「2次元座標系 + 発想の転換」

import math

def main():
    N, K = map(int, input().split()) # N, K の値を入力
    A: tuple[int, ...] = tuple(map(int, input().split())) # A の値を入力
    COORDINATES: tuple[tuple[int, int], ...] = tuple([(0, 0)] + [tuple(map(int, input().split())) for _ in range(N)]) # 座標を入力 (要素数: N+1) (0 番目はダミー)
    r_max: float = 0
    for i in range(1, N+1):
        r_max_i: float = 10e6 # √(|X|^2 + |Y|^2)) < 10^6
        for k in A:
            if i == k: # 人 i が明かりを持っている場合
                r_max_i = 0
                break
            r: float = math.dist(COORDINATES[i], COORDINATES[k])
            r_max_i = min(r_max_i, r) # 人 i の 明かりを持つ人 k までの最小距離を更新

        r_max = max(r_max, r_max_i) # すべての人の中で, 最も遠い明かりを持つ人までの距離を更新

    print(f'{r_max:.6f}')

if __name__ == '__main__':
    main()