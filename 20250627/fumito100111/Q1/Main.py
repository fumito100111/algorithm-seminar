# テーマ: 「2次元座標系 + ひらめき」

def main():
    CENTER: tuple[int, int] = (8, 8) # 中心座標
    R, C = map(int, input().split()) # R, C の値を入力

    chebyshev_distance: int = max(abs(R - CENTER[0]), abs(C - CENTER[1])) # チェビシェフ距離

    if chebyshev_distance % 2 == 0:
        print('white')
    else:
        print('black')

if __name__ == '__main__':
    main()