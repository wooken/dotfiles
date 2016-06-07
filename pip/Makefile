.PHONY: install
install:
	sudo pip install -r pip.txt

.PHONY: upgrade
upgrade:
	pip freeze | grep -v "^-e" | xargs sudo pip install -U

.PHONY: clean
clean:
	pip freeze | grep -v "^-e" | xargs sudo pip uninstall -y
