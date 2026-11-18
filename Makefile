# edit this Makefile as necessary for your project
.PHONY: install fonts

install:
	echo "installed (test message)"

fonts: ## Subset the vendored web fonts to the characters used in slides-jp/index.html
	scripts/subset-fonts.sh
