import math

def main():
    n, k = map(int, input().split())
    a = set(map(lambda x: x-1, map(int, input().split())))
    x = [0] * n
    y = [0] * n
    for i in range(n):
        x[i], y[i] = map(int, input().split())

    result = 0
    for i in range(n):
        if i in a:
            continue

        min_dist = float('inf')
        for j in range(n):
            if j in a:
                dist = math.sqrt((x[i] - x[j])**2 + (y[i] - y[j])**2)
                if dist < min_dist:
                    min_dist = dist

        if min_dist > result:
            result = min_dist

    print(f"{result:.6f}")

if __name__ == '__main__':
    main()