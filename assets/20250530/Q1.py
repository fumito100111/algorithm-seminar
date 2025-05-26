import random

N: int = random.randint(1, 100)
A: list[int] = list[int]()
B: list[int] = list[int]()

print('< 入力 >\n')
print(N)
for _ in range(N):
    a: int = random.randint(-10**9, 10**9)
    b: int = random.randint(-10**9, 10**9)
    print(f'{a} {b}')
    A.append(a)
    B.append(b)

print('\n\n< 出力 >\n')
for a, b in zip(A, B):
    print(a + b)