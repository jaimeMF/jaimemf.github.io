WEBSITE = source VENV/bin/activate; python website.py

NEOCITIES_BIN = bundle exec neocities

.PHONY: build clean neocities-push

build:
	$(WEBSITE) build

serve:
	$(WEBSITE)

clean:
	rm -r build

neocities-push:
	$(NEOCITIES_BIN) push build
