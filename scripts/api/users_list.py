import sys
import pathlib
import json
from typing import Any

if __name__ == '__main__':
    # 引数からカレントディレクトリを取得 (引数0: 実行中のスクリプト名, 引数1: JSON ファイルのパス)
    JSON_FILE_PATH: pathlib.Path = pathlib.Path(sys.argv[1])
    if len(sys.argv) == 3:
        option = sys.argv[2]

    # JSON ファイルからユーザ & 使用言語を取得
    try:
        with open(JSON_FILE_PATH, 'r') as f:
            INFO: dict[str: Any] = json.load(f)
            USERS: dict[str: str] = INFO['users']
    except:
        print(f'\'{JSON_FILE_PATH}\' が存在しません.')
        sys.exit(0)

    MAX: int = max([len(user) for user in USERS.keys()]) # ユーザ名の最大文字数
    print('ユーザ名 : 使用言語 (拡張子)')
    print('----------------------------')
    for key, value in USERS.items():
        print(f'{key.ljust(MAX)} : {value}')
