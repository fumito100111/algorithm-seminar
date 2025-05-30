def main():
    N = int(input())
    for i in range(N):
        l = list(map(int, input().split()))
        print(l[0] + l[1])
    return 0

if __name__ == '__main__':
    main()