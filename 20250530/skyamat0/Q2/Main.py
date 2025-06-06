import heapq

def main():
    N, K = map(int, input().split())
    topk_players = []
    for i in range(K):
        heapq.heappush(topk_players, input())
    for j in range(K):
        print(heapq.heappop(topk_players))
    return 0

if __name__ == '__main__':
    main()