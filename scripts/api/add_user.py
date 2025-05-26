import sys
import pathlib
import json
from typing import Any

if __name__ == '__main__':
    # 引数からカレントディレクトリ & 追加するユーザ名 & 使用言語の拡張子を取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: 追加するユーザ名, 引数3: 使用言語の拡張子)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    user: str = sys.argv[2]
    ext: str = sys.argv[3]

    # JSON ファイルからユーザ & 使用言語を取得
    if not (current_dir/'info.json').exists():
        (current_dir/'info.json').touch(exist_ok=True)
        info: dict[str: Any] = {
            "users": dict[str: str]()
        }

    else:
        with open(current_dir/'info.json', 'r') as f:
            info: dict[str: Any] = json.load(f)

    if user in info['users'].keys():
        print(f'\'{user}\'はすでに登録されています.')
        sys.exit(0)
    info['users'][user] = ext

    # JSON ファイルにユーザ & 使用言語を書き込み
    with open(current_dir/'info.json', 'w') as f:
        json.dump(info, f, ensure_ascii=False, indent=4)