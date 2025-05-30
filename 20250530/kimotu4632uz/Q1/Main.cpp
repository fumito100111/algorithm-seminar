# include <iostream>
using namespace std;
using ll = long long;
#define all(v) std::ranges::begin((v)), std::ranges::end((v))
#define REP(i, n)    for (int i = 0; i < (n); i++)


int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);

    int n;
    cin >> n;
    vector<int> a(n), b(n);

    REP(i, n) cin >> a[i] >> b[i];
    REP(i, n) cout << a[i] + b[i] << endl;

    return 0;
}