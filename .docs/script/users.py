import sys
import pathlib
import json

if __name__ == '__main__':
    # 引数からカレントディレクトリを取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: オプション)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    option: str = 'items' # オプション: 'items': key, value を返す, 'keys': key のみを返す, 'values': value のみを返す
    if len(sys.argv) == 3:
        option = sys.argv[2]

    # JSON ファイルからユーザ & 使用言語を取得
    try:
        with open(current_dir/'.docs/users.json', 'r') as f:
            users: dict[str: str] = json.load(f)
    except:
        sys.exit(0)
    
    for key, value in users.items():
        if option == 'items':
            print(f'{key},{value}')
        elif option == 'keys':
            print(key)
        elif option == 'values':
            print(value)
        else:
            print(f'オプション \'{option}\' はありません.')
            sys.exit(1)