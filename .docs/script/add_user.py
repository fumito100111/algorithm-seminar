import sys
import pathlib
import json

if __name__ == '__main__':
    # 引数からカレントディレクトリ & 追加するユーザ名 & 使用言語を取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: 追加するユーザ名, 引数3: 使用言語)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    user: str = sys.argv[2]
    language: str = sys.argv[3]

    # JSON ファイルからユーザ & 使用言語を取得
    if not (current_dir/'.docs/users.json').exists():
        (current_dir/'.docs/users.json').touch(exist_ok=True)
        users: dict[str: str] = dict[str: str]()
    else:
        with open(current_dir/'.docs/users.json', 'r') as f:
            users: dict[str: str] = json.load(f)

    if user in users.keys():
        print(f'\'{user}\'はすでに登録されています.')
        sys.exit(0)
    users[user] = language

    # JSON ファイルにユーザ & 使用言語を書き込み
    with open(current_dir/'.docs/users.json', 'w') as f:
        json.dump(users, f, ensure_ascii=False, indent=4)