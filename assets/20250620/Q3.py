import random

N: int = random.randint(2, 500)
CORDINATES: set[tuple[int, int]] = set()

while len(CORDINATES) < N:
    x: int = random.randint(1, 10**9)
    y: int = random.randint(1, 10**9)
    CORDINATES.add((x, y))

print(N)
for _ in range(N-1):
    x, y = CORDINATES.pop()
    print(f'{x} {y}')
x, y = CORDINATES.pop()
# print(f'{x} {y}', end='')
print(f'{x} {y}')
