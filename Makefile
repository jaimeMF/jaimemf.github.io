PROG=./site
site: site.hs
	ghc --make $^ -package-db $(wildcard ./.cabal-sandbox/*packages.conf.d)


build: site
	./site build

watch: site
	./site watch

clean: site
	./site clean
