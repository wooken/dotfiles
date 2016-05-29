.PHONY: install
install:
	sudo pip install -r pip.txt

.PHONY: upgrade
upgrade:
	sudo pip install -r pip.txt --upgrade

.PHONY: clean
clean:
	pip freeze | grep -v "^-e" | xargs sudo pip uninstall -y
