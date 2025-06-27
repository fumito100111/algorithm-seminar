import math
def main():
    N, K = map(int, input().split())
    lights = list(map(int, input().split()))
    people = [list(map(int, input().split())) for _ in range(N)]
    R = 0
    for x, y in people:
        tmp_R = 282843
        for a in lights:
            center_x, center_y = people[a-1]
            r = math.sqrt((x-center_x)**2+(y-center_y)**2)
            tmp_R = min(r, tmp_R)
        R = max(R, tmp_R)
    print(R)

if __name__ == '__main__':
    main()