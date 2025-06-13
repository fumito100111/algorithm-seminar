from collections import deque

def main():
    h, w = map(int, input().split())

    # strはlistに入れると ['a', 'b', 'c'] のように1文字ずつ分解される（知らなかった）
    s = [list(input()) for _ in range(h)]

    # '#'の数を数える
    black_num = 0
    for i in range(h):
        for j in range(w):
            if s[i][j] == '#':
                black_num += 1

    # 最短経路を求める
    min_dist = -1

    # queueを使って幅優先探索
    q = deque()
    # 初期状態は (x座標, y座標, 距離) = (0, 0, 0)
    q.append((0,0,0))
    while len(q) != 0:
        x, y, d = q.popleft()

        # 終点なら距離を記録して終了
        if x == h - 1 and y == w - 1:
            min_dist = d
            break

        # 全ての方向に移動
        for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
            nx, ny = x + dx, y + dy

            # 移動可能なら移動
            if 0 <= nx < h and 0 <= ny < w and s[nx][ny] != '#':
                # すでに訪れた場所は通れないようにする
                s[nx][ny] = '#'

                # 状態をキューに追加
                q.append((nx, ny, d+1))

    # 到達できなかったら-1
    if min_dist == -1:
        print(-1)

    # 到達できたら、全体のマス数から'#'の数と最短距離を引く
    else:
        print(h*w - min_dist - black_num - 1)


if __name__ == '__main__':
    main()