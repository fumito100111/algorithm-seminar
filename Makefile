CURRENT_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
LANGUAGE="py"

add_user:
	@if [ -z $(USER) ]; then \
		echo "USER が設定されていません."; \
		exit 1; \
	fi
	@python3 $(CURRENT_DIR).docs/script/add_user.py $(CURRENT_DIR) $(USER) $(LANGUAGE)

delete_user:
	@if [ -z $(USER) ]; then \
		echo "USER が設定されていません."; \
		exit 1; \
	fi
	@python3 $(CURRENT_DIR).docs/script/delete_user.py $(CURRENT_DIR) $(USER)

user_list:
	@python3 $(CURRENT_DIR).docs/script/user_list.py $(CURRENT_DIR)

create_template:
	@if [ -z $(DATE) ]; then \
		echo "DATE が設定されていません."; \
		exit 1; \
	fi
	@if [ -z $(NUM) ]; then \
		echo "NUM が設定されていません."; \
		exit 1; \
	fi
	@git pull origin main
	@python3 $(CURRENT_DIR).docs/script/create_template.py $(CURRENT_DIR) $(DATE) $$(git config user.name) $(NUM)
	@sh $(CURRENT_DIR).docs/script/update_readme.sh $(CURRENT_DIR) $(DATE) $(NUM)

remove:
	@if [ -z $(DATE) ]; then \
		echo "DATE が設定されていません."; \
		exit 1; \
	fi
	@rm -rf $(CURRENT_DIR)$(DATE)

run:
	@if [ -z $(DATE) ]; then \
		echo "DATE が設定されていません."; \
		exit 1; \
	fi
	@if [ -z $(FILE) ]; then \
		echo "FILE が設定されていません."; \
		exit 1; \
	fi
	@sh $(CURRENT_DIR)$(DATE)/.tests/run.sh $(FILE)

test:
	@if [ -z $(DATE) ]; then \
		echo "DATE が設定されていません."; \
		exit 1; \
	fi
	@if [ -z $(QUESTION) ]; then \
		sh $(CURRENT_DIR)$(DATE)/.tests/test.sh $(CURRENT_DIR) $$(git config user.name) $(DATE) all; \
	else \
		sh $(CURRENT_DIR)$(DATE)/.tests/test.sh $(CURRENT_DIR) $$(git config user.name) $(DATE) $(QUESTION); \
	fi