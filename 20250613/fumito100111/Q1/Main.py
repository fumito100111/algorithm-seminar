def main():
    N, M, X = map(int, input().split())
    C = []
    A = []
    for _ in range(N):
        inputs = input().split()
        C.append(int(inputs[0]))
        a = []
        for m in range(M):
            a.append(int(inputs[m+1]))
        A.append(a)

    


if __name__ == '__main__':
    main()