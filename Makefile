.PHONY: build clean_code clean_data clean generate_zurich_data generate_vaira_data generate_data

build:
	matlab -nodisplay -batch "setup"
	cp TeC/MOD_PARAM_ZURICH_SMA.m .

generate_zurich_data:
	matlab -nodisplay -batch "generate_zurich_data"

generate_vaira_data:
	matlab -nodisplay -batch "generate_VAIRA_data"

generate_data: generate_zurich_data generate_vaira_data

clean_code:
	# Backup excluded functions while preserving package structure
	mkdir -p wrapped_backup
	while read -r func; do \
    echo "Looking for: $${func}.m"; \
		find wrapped -name "$${func}.m" -exec bash -c 'echo "Found: {}"; cp "{}" wrapped_backup' \; ; \
	done < excluded_functions.txt
	rm -rf wrapped
	# Restore excluded functions with package structure
	mkdir -p wrapped
	cp -r wrapped_backup/* wrapped/
	rm -rf wrapped_backup

clean_data:
	rm -rf +data_functions
	rm -rf data

clean: clean_code clean_data

all: build generate_data
