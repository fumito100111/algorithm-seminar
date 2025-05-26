def main():
    N: int = int(input())      # 入力: N

    for i in range(N):
        A, B = map(int, input().split()) # 入力: A_i, B_i
        print(A+B) # 出力: A_i + B_i

if __name__ == '__main__':
    main()