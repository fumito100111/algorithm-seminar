import sys
import pathlib
import json

if __name__ == '__main__':
    # 引数からカレントディレクトリを取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: 取得したいユーザの名前, 引数3: オプション)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    user: str = sys.argv[2]
    option: str = 'item' # オプション: 'item': key, value を返す, 'value': value のみを返す
    if len(sys.argv) == 4:
        option = sys.argv[3]

    # JSON ファイルからユーザ & 使用言語を取得
    try:
        with open(current_dir/'.docs/users.json', 'r') as f:
            users: dict[str: str] = json.load(f)
    except:
        sys.exit(0)
    
    if option == 'item':
        print(f'{user},{users[user]}')
    elif option == 'value':
        print(users[user])
    else:
        print(f'オプション \'{option}\' はありません.')
        sys.exit(1)