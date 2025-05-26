.PHONY: create_template update_template delete_template add_user delete_user users_list test submit

#========== 課題用テンプレートに関するコマンド ==========#
# 環境変数
DATE = $$(date "+%Y%m%d")			# デフォルトの日付
ASSIGNMENTS = 5						# デフォルトの課題の総数

# 課題用テンプレートを作成するコマンド
create_template:
	@./scripts/create_template.sh ${DATE} ${ASSIGNMENTS}

# 課題用テンプレートを GitHub へ更新するコマンド
update_template:
	@./scripts/update_template.sh ${DATE}

# 課題用テンプレートを削除するコマンド
delete_template:
	@rm -rf ./${DATE}

# 入力ケースから出力ケースを作成するコマンド
create_answer:
	@./scripts/create_answer.sh ${DATE}

#========== ユーザ情報に関するコマンド ==========#
# 環境変数
USER = $$(git config user.name)		# デフォルトのユーザ名
EXT = "py"							# デフォルトの拡張子

# info.json へユーザ情報を追加するコマンド
add_user:
	@python3 ./scripts/api/add_user.py $$(pwd) ${USER} ${EXT}
	@./scripts/update_info.sh ${USER} add

# info.json のユーザ情報を更新するコマンド
update_user:
	@python3 ./scripts/api/update_user.py $$(pwd) ${USER} ${EXT}
	@./scripts/update_info.sh ${USER} update

# info.json からユーザ情報を削除するコマンド
delete_user:
	@python3 ./scripts/api/delete_user.py $$(pwd) ${USER}
	@./scripts/update_info.sh ${USER} delete

# info.json へ登録済みのユーザ情報を出力するコマンド
users_list:
	@echo "ユーザ名,拡張子"
	@echo "---------------"
	@python3 ./scripts/api/users_list.py $$(pwd)/info.json


#========== 採点に関するコマンド ==========#
# 環境変数
DATE = $$(date "+%Y%m%d")			# デフォルトの日付
ASSIGNMENT = "ALL"					# デフォルトの課題の総数

# ローカル環境でテストを行うコマンド
test:
	@./scripts/test_local.sh ${DATE} ${ASSIGNMENT}

# 課題を提出するコマンド
submit:
	@./scripts/submit.sh