import sys
import pathlib
import shutil
import json
from typing import Any

SUPPORTED_EXTENSIONS: list[str] = [ # 対応する言語 (拡張子)
    "c",
    "cpp",
    "py",
    "java"
]
TEST_CASES: int = 5 # テストケースの数

if __name__ == '__main__':
    # 引数からカレントディレクトリ & 作成する日付を取得 (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: 作成する日付, 引数3: 自分のユーザ名)
    current_dir: pathlib.Path = pathlib.Path(sys.argv[1])
    date: str = sys.argv[2]
    user_name: str = sys.argv[3]
    template_dir: pathlib.Path = current_dir/'.docs/template'

    if not (current_dir/'.docs/users.json').exists():
        print("登録されているユーザは存在しません.")
        sys.exit(1)

    # JSON ファイルからユーザ & 使用言語を取得
    try:
        with open(current_dir/'.docs/users.json', 'r') as f:
            users: dict[str: str] = json.load(f)
    except:
        print("登録されているユーザは存在しません.")
        sys.exit(1)
    
    # それぞれのユーザごとに課題フォルダを作成
    for key, value in users.items():
        dir: pathlib.Path = current_dir/date/key
        dir.mkdir(parents=True, exist_ok=True)
        if value not in SUPPORTED_EXTENSIONS:
            print(f'\'{key}\' の拡張子 \'{value}\' は対応していません.')
            sys.exit(1)    
        shutil.copy(src=template_dir/f'Main.{value}', dst=dir/f'Main.{value}')

    # README.md を作成
    shutil.copy(src=template_dir/f'README.md', dst=current_dir/date/f'README.md')

    # テストケースのフォルダ & ファイルを作成
    test_dir: pathlib.Path = current_dir/date/f'.tests'
    test_dir.mkdir(parents=True, exist_ok=True)
    inputs_dir: pathlib.Path = test_dir/f'inputs'
    inputs_dir.mkdir(parents=True, exist_ok=True)
    outputs_dir: pathlib.Path = test_dir/f'outputs'
    outputs_dir.mkdir(parents=True, exist_ok=True)

    # run.sh & test.sh の作成
    shutil.copy(src=current_dir/'.docs/template/run.sh', dst=test_dir/'run.sh')
    shutil.copy(src=current_dir/'.docs/template/test.sh', dst=test_dir/'test.sh')

    # テストケースの作成
    for index in range(1, TEST_CASES+1):
        (inputs_dir/f'{index}.txt').touch()
        (outputs_dir/f'{index}.txt').touch()

    # info ファイルの作成 (対応言語, テストケース数など)
    info: dict[str: Any] = {
        "CREATOR": user_name,
        "SUPPORTED-EXTENSIONS": SUPPORTED_EXTENSIONS,
        "TEST-CASES": TEST_CASES
    }
    info_file: pathlib.Path = test_dir/'info.json'
    with open(info_file, 'w') as f:
        json.dump(info, f, ensure_ascii=False, indent=4)