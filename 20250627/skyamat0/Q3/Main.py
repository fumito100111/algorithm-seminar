import math
def main():
    N = int(input())
    towns = [list(map(int, input().split())) for _ in range(N)]
    magic_set = set()
    for i in range(N-1):
        current_town_x, current_town_y = towns[i]
        for j in range(i+1, N):
            target_town_x, target_town_y = towns[j]
            a = target_town_x - current_town_x
            b = target_town_y - current_town_y
            gcd = math.gcd(a, b)
            magic = (a//gcd, b//gcd)
            rev_magic = (-a//gcd, -b//gcd)
            magic_set.add(magic)
            magic_set.add(rev_magic)
    print(len(magic_set))
    return 0
if __name__ == '__main__':
    main()