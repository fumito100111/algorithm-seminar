def main():
    NUM = 10000000
    x, n = map(int, input().split())
    bin_n = bin(n)[2:]
    result = 1
    for i in bin_n[::-1]:
        if i == '1':
            result = (result * (x % NUM)) % NUM
        x *= x
    print(result)

 
 
if __name__ == '__main__':
    main()