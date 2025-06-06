"""
繰り返し二乗法は、次のようなアルゴリズムです。
ここでは、x^n を計算することを考えます。
・ result = 1 とする。
・ i = 1 から k まで、以下の処理を繰り返す。(k は最大のビット数とします。)
1. n の下から i 番目のビットが 1 であるならば、result <- result・x とする。
2. x <- x・x とする。

整数 x と整数 n が与えられるので、x^n を高速に計算してください。
ただし、答えは非常に大きくなる可能性があるため、10000000 = 10^7 で割ったあまりを出力してください
"""

def main_bekkai():
    p = 10**7
    x,n = map(int, input().split())
    r = pow(x, n, p)
    print(r)
    return 0 
def main():
    p = 10**7
    x,n = map(int, input().split())
    r = pow_mod(x, n, p)
    print(r)
    return 0
def pow_mod(x, n, p):
    bin_expr = bin(n)[2:][::-1]
    r = 1
    for i in bin_expr:
        if i == "1":
            r *= (x % p)
            r %= p
        elif i == "0":
            pass
        else:
            continue
        x *= x
    return r

if __name__ == "__main__":
    main()
    # main_bekkai()
