WEBSITE = source VENV/bin/activate; python website.py

build:
	$(WEBSITE) build

serve:
	$(WEBSITE)

clean:
	rm -r build
