# edit this Makefile as necessary for your project
.PHONY: install fonts serve

# Where `make serve` listens. HOST=0.0.0.0 exposes the deck to the local network.
PORT ?= 8000
HOST ?= 127.0.0.1

install:
	echo "installed (test message)"

fonts: ## Subset the vendored web fonts to the characters used in slides-jp/index.html
	scripts/subset-fonts.sh

# A plain static server: reveal.js's `npm start` (gulp serve) does not start on Node 26.
serve: ## Serve slides-jp/ at http://localhost:8000 (PORT=, HOST= to change; Ctrl-C to stop)
	python3 -m http.server $(PORT) --bind $(HOST) --directory slides-jp
