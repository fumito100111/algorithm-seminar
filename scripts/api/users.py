import sys
import pathlib
import json
from typing import Any

if __name__ == '__main__':
    # 引数からカレントディレクトリを取得 (引数0: 実行中のスクリプト名, 引数1: JSON ファイルのパス, 引数2: オプション)
    JSON_FILE_PATH: pathlib.Path = pathlib.Path(sys.argv[1])
    option: str = 'items' # オプション: 'items': key, value を返す, 'keys': key のみを返す, 'values': value のみを返す
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
    
    for key, value in USERS.items():
        if option == 'items':
            print(f'{key},{value}', end='\n')
        elif option == 'keys':
            print(key, end='\n')
        elif option == 'values':
            print(value, end='\n')
        else:
            print(f'オプション \'{option}\' はありません.')
            sys.exit(1)