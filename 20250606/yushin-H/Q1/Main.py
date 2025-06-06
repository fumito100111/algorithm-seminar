def main():
    x, n = map(int, input().split())
    xn = 1
    for i in range (n):
        xn = xn*x

    print(xn%1000000)

    
main()
