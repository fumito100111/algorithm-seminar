def main():
    N = int(input())
    if not (1 <= N <= 1000):
        raise ValueError("NO")
    for _ in range(N):
        A, B = map(int, input().split())
        print(A + B)
    pass

if __name__ == '__main__':
    main()