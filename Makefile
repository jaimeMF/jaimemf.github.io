WEBSITE = source VENV/bin/activate; python website.py

.PHONY: build clean

build:
	$(WEBSITE) build

serve:
	$(WEBSITE)

clean:
	rm -r build
