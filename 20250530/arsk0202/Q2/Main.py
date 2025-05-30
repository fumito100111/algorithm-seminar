def main():
    pass

if __name__ == '__main__':
    main()
    N, K = map(int, input().split())
    name = []
    for _ in range(N):
        S = input()
        name.append(S)
    
    k = name[:K]
    k = sorted(k)

    for name in k:
        print(name)