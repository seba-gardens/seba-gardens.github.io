## ========================================
## Build the website locally

# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=bundle config --local set path .vendor/bundle && bundle install && bundle update && bundle exec jekyll
DST=_site

all: serve
.PHONY: all clean linkcheck serve site

## build website and run a local server
serve:
	${JEKYLL} serve --config _config.yml

## build website but do not run a server
site:
	${JEKYLL} build --config _config.yml

linkcheck:
	bundle exec htmlproofer --check-html --allow-hash-href --empty-alt-ignore _site

spellcheck:
	codespell --check-filenames --ignore-words-list="rouge,sting,tim" --skip="assets,.bundle,.git,_site,*.svg,.vendor" --quiet-level=2

## clean up junk files
clean :
	@rm -rf ${DST}
	@rm -rf .jekyll-cache
	@rm -rf .sass-cache
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
