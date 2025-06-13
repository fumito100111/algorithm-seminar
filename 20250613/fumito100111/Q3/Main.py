# 黒: 1, 白: 1
from collections import deque

def main():
    H, W = map(int, input().split())
    S = []
    filled_block = 0
    for _ in range(H):
        inputs = input().split()
        s = ['']
        for s_i in inputs:
            if s_i == '#':
                s.append(1)
                filled_block += 1
            else:
                s.append(0)
        S.append(s)
    sx, sy = 0, 0
    gx, gy = H-1, W-1

    dist = [[10**9 for _ in range(H)] for _ in range(W)]
    dist[sx][sy] = 0
    q = deque()
    q.append((sx, sy))
    while len(q) != 0:
        x, y = q[0]
        q.popleft()
    # おそらく, 最短経路問題 (BFS かな...)

    

if __name__ == '__main__':
    main()