import sys
import pathlib
import json

if __name__ == '__main__':
    # 引数からカレントディレクトリを取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])

    # JSON ファイルからユーザ & 使用言語を取得
    with open(current_dir/'.docs/users.json', 'r') as f:
        users: dict[str: str] = json.load(f)

    print('ユーザ名 : 使用言語 (拡張子)')
    for key, value in users.items():
        print(f'{key} : {value}')