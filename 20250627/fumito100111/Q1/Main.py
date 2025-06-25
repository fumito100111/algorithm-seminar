# テーマ: 「2次元座標系 + ひらめき」

def main():
    CENTER: tuple[int, int] = (8, 8) # 中心座標
    R, C = map(int, input().split()) # R, C の値を入力

    chebyshev_distance: int = max(abs(R - CENTER[0]), abs(C - CENTER[1])) # チェビシェフ距離

    if chebyshev_distance % 2 == 0:
        print('white')
    else:
        print('black')

def main():
    board: str = '111111111111111\n' \
               + '100000000000001\n' \
               + '101111111111101\n' \
               + '101000000000101\n' \
               + '101011111110101\n' \
               + '101010000010101\n' \
               + '101010111010101\n' \
               + '101010101010101\n' \
               + '101010111010101\n' \
               + '101010000010101\n' \
               + '101011111110101\n' \
               + '101000000000101\n' \
               + '101111111111101\n' \
               + '100000000000001\n' \
               + '111111111111111'

    board: list[str] = board.split('\n')

    R, C = map(int, input().split()) # R, C の値を入力
    R -= 1  # 0 始まりに変換
    C -= 1  # 0 始まりに変換

    if board[R][C] == '1':
        print('black')

    else:
        print('white')

if __name__ == '__main__':
    main()