def sort(l: list[str]) -> list[str]:
    l_sorted: list[str] = [l[0]] # ソート済みの配列 (初期配列: 配列の 0 番目の要素)
    for i, value in enumerate(l[1:]):
        insert_index: int = -1 # 追加するインデックス ( -1 のままの場合, 最後に追加する)
        for j in range(i + 1): # すでにソート済みの配列の要素数分繰り返す ( i = 0 のとき, 初期配列に配列の 0 番目の要素が入っているので, i + 1 になる)
            target: str = l_sorted[j]
            L: int = min(len(value), len(target))
            k: int = 0 # value & target の k 文字目を表現するインデックス
            for _ in range(L):
                if ord(value[k]) < ord(target[k]): # 追加する値が target よりも順番が小さい場合
                    insert_index = j # 追加するインデックスを決定
                    break # k の for 文から抜ける
                elif ord(value[k]) > ord(target[k]): # 追加する値が target よりも順番が大きい場合
                    break # k の for 文から抜ける
                k += 1 # k をインクリメントする


            if insert_index != -1:
                break # 追加するインデックスが決まった場合, j の for 文から抜ける

            if k == L and len(value) < len(target): # どちらかの要素と接頭語が完全に一致していて, かつ 追加する値の方が文字数が小さい場合
                insert_index = j + 1
                break
        
        if insert_index == -1: # 追加する値がどの要素よりも順番が大きい場合
            insert_index = i + 1
        
        l_sorted.insert(insert_index, value) # insert_index 番目の要素に追加する
    
    return l_sorted # ソート済みの配列を返す

def main():
    N, K = map(int, input().split()) # 入力: N, K
    S: list[str] = list[str]() # 入力 S を保存するための配列
    for i in range(N):
        S.append(input())

    S = S[:K]
    S = sort(S)

    # S.sort() # Python デフォルトの組み込み関数を使用すれば 1 行で書ける.

    for s in S:
        print(s) # 上位 K 人のハンドルネーム (辞書順)

if __name__ == '__main__':
    main()