def make_factorials(n_max, p):
    """
    0 <= i <= n_max について
    fact[i]     = i! mod p
    inv_fact[i] = (i!)^{-1} mod p
    を返す。
    """
    fact     = [1] * (n_max + 1)
    inv_fact = [1] * (n_max + 1)

    # fact[i] = i! mod p
    for i in range(1, n_max + 1):
        fact[i] = fact[i - 1] * i % p

    # inv_fact[n_max] = (fact[n_max])^{p-2} mod p
    inv_fact[n_max] = pow(fact[n_max], p - 2, p)

    # inv_fact[i-1] = inv_fact[i] * i mod p という形で逆元を下向きに計算
    for i in range(n_max, 0, -1):
        inv_fact[i - 1] = inv_fact[i] * i % p

    return fact, inv_fact

def nCk_mod(n, k, fact, inv_fact, p):
    """
    0 <= k <= n <= n_max の範囲で
    nCk mod p を O(1) で返す。
    """
    if k < 0 or k > n:
        return 0
    return fact[n] * inv_fact[k] % p * inv_fact[n - k] % p


def main():
    H, W, A, B = map(int, input().split())
    mod = 10**9 + 7

    # 必要な nCk の最大引数を考える
    # ループ内で使う nCk のうち、最大で n = max(B+i-1, H+W-B-i-2) あたりまでなので、
    # H+W たとえば <= 2*10^6 くらいを想定しておけば十分（制約に合わせて調整を）。
    N_max = H + W
    fact, inv_fact = make_factorials(N_max, mod)

    ans = 0
    # i=0,...,H-A-1 について足し合わせる
    for i in range(H - A):
        # (B+i-1)Ci  と  (H+W-B-i-2)C(H-i-1) の二項係数を O(1) で呼び出し
        term1 = nCk_mod(B + i - 1, i, fact, inv_fact, mod)
        term2 = nCk_mod(H + W - B - i - 2, H - i - 1, fact, inv_fact, mod)
        ans = (ans + term1 * term2) % mod

    print(ans)

if __name__ == "__main__":
    main()