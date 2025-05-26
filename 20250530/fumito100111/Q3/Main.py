class UnionFind(object):
    n: int # 頂点の数
    root: list[int] # それぞれの頂点が属するグラフの親の頂点を保存する配列 (要素数: 頂点の数)
    def __init__(self, n: int):
        self.n = n
        self.root = [v for v in range(n)] # 初期値はそれぞれの頂点が親

    # 頂点 v1, v2 を結合する
    def union(self, v1: int, v2: int):
        root_v1: int = self.find(v1)
        root_v2: int = self.find(v2)
        if root_v1 != root_v2: # 頂点 v1 と v2 の親の頂点が違う場合は, 頂点番号が小さい方に結合する
            v_min: int = min(root_v1, root_v2)
            self.root[max(root_v1, root_v2)] = v_min # 親の頂点番号の小さい方に結合する            

    # 頂点 v の親の頂点を調べる
    def find(self, v: int) -> int:
        if self.root[v] == v:
            return v
        else:
            self.root[v] = self.find(self.root[v]) # 頂点 v が親ではない場合, v の親の頂点を引数として, find 関数を再起的に呼び出す.
            return self.find(self.root[v])

def main():
    #===== この問題のキーポイント: 閉路になる最大の辺の数を数える問題へ発想を変える =====#

    N, M = map(int, input().split()) # 入力: 頂点 N, 辺 M
    uf: UnionFind = UnionFind(N) # Union-Find アルゴリズム
    delete_edges: int = 0 # 削除するべき辺の本数 (問題の答え)
    for _ in range(M):
        a, b = map(int, input().split())
        a -= 1 # 頂点を 0 始まりにするためデクリメント
        b -= 1 # 頂点を 0 始まりにするためデクリメント

        if uf.find(a) == uf.find(b): # すでに頂点 a と b の親の頂点が同じ場合, 閉路になるので最低でも削除するべき
            delete_edges += 1 # 閉路になるために削除すべき辺の数をインクリメント

        else: # まだ頂点 a と b の親の頂点が同じではないので, 親の頂点を結合する
            uf.union(a, b)
    
    print(delete_edges)

if __name__ == '__main__':
    main()