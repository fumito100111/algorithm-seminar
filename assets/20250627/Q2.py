import random

N: int = random.randint(1, 1000)
K: int = random.randint(1, N)

A: list[int] = sorted(random.sample(range(1, N + 1), K))

CORDINATES: set[tuple[int, int]] = set()

while len(CORDINATES) < N:
    x: int = random.randint(1, 10**5)
    y: int = random.randint(1, 10**5)
    CORDINATES.add((x, y))


print(f'{N} {K}')
for a in A[:-1]:
    print(a, end=' ')
print(A[-1])

for _ in range(N-1):
    x, y = CORDINATES.pop()
    print(f'{x} {y}')
x, y = CORDINATES.pop()
# print(f'{x} {y}', end='')
print(f'{x} {y}')

