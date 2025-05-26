import random
import string

N: int = random.randint(1, 100)
K: int = random.randint(1, N)

print('< 入力 >\n')

print(f'{N} {K}')
S: list[str] = list[str]()
for _ in range(N):
    while True:
        length: int = random.randint(1, 10)
        name: str = ''
        chars: list[str] = random.choices(string.ascii_lowercase, k=length)
        for char in chars:
            name += char
        if name not in S:
            S.append(name)
            break

for s in S:
    print(s)

print('\n\n< 出力 >\n')

for s in sorted(S[:K]):
    print(s)