# include <iostream>
#include <vector>
#include <string>
using namespace std;
using ll = long long;
#define all(v) std::ranges::begin((v)), std::ranges::end((v))
#define REP(i, n)    for (int i = 0; i < (n); i++)


int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);

    int n, k;
    cin >> n >> k;
    vector<string> s(k);
    REP(i, k) cin >> s[i];

    REP(i,k) {
        for (int j = k-1; j > i; j--) {
            int len = min(s[j-1].length(), s[j].length());
            bool swapped = false;
            REP(l, len) {
                if (s[j-1][l] > s[j][l]) {
                    string tmp = s[j];
                    s[j] = s[j-1];
                    s[j-1] = tmp;
                    swapped = true;
                    break;
                }
            }
            if (!swapped && s[j-1].length() > s[j].length()) {
                string tmp = s[j];
                s[j] = s[j-1];
                s[j-1] = tmp;
            }
        }
    }

    REP (i,k) cout << s[i] << endl;
    return 0;
}