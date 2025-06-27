def main():
    N, K = list(map(int, input().split()))
    A_k = list(map(int, input().split()))
    X=[]
    Y=[]
    for i in range(N):
        x, y = list(map(int, input().split()))
        X.append(x)
        Y.append(y)
    print(X)
    pass

if __name__ == '__main__':
    main()