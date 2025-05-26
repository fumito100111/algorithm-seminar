import sys
import pathlib
import json
from typing import Any

if __name__ == '__main__':
    # 引数からカレントディレクトリ & 削除するユーザ名を取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: 削除するユーザ名)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    user: str = sys.argv[2]

    if not (current_dir/'info.json').exists():
        print("登録されているユーザは存在しません.")
        sys.exit(0)

    # JSON ファイルからユーザ & 使用言語を取得
    try:
        with open(current_dir/'info.json', 'r') as f:
            info: dict[str: Any] = json.load(f)
            if user not in info['users'].keys():
                print(f'\'{user}\' は登録されていません.')
                sys.exit(0)
            del info['users'][user]
    except:
        print("登録されているユーザは存在しません.")
        sys.exit(0)

    # JSON ファイルにユーザ & 使用言語を書き込み
    with open(current_dir/'info.json', 'w') as f:
        json.dump(info, f, ensure_ascii=False, indent=4)