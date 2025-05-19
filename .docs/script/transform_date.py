import sys
import datetime

if __name__ == '__main__':
    # 引数から日付を取得 (引数0: 実行中のスクリプト名, 引数1: 日付, 引数2: オプション)
    date: str = sys.argv[1]
    option: int = 1 # オプション: 0: エスケープなし, 1: エスケープあり
    if len(sys.argv) == 3:
        option = sys.argv[2]
    if len(date) != 8:
        print('\'DATE\' は \'yyyymmdd\' の型で入力してください.')
        sys.exit(1)
    year: int = int(date[0:4])
    month: int = int(date[4:6])
    day: int = int(date[6:8])

    date: datetime.date = datetime.date(year, month, day)
    weekday: str = '月火水木金土日'[date.weekday()]
    if option:
        print(f'{year} \\/ {month} \\/ {day} ({weekday})')
    else:
        print(f'{year} / {month} / {day} ({weekday})')