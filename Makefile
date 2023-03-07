## ========================================
## Build the website locally

# Settings
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
	bundle exec htmlproofer --allow-hash-href \
                            --empty-alt-ignore \
                            --only-4xx \
                            $(DST)

spellcheck:
	codespell --check-filenames \
              --ignore-words-list="rouge,sting,tim" \
              --skip="assets,.bundle,.git,${DST},*.svg,.vendor" \
              --quiet-level=2

## clean up junk files
clean :
	@rm -rf ${DST}
	@rm -rf .bundle
	@rm -rf .jekyll-cache
	@rm -rf .sass-cache
	@rm -rf .vendor
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
	@rm -f Gemfile.lock
