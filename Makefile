all: install
	gitbook build

pdf: install
	gitbook pdf

install:
	gitbook install

test: install
	sed -i -e "/English/d" LANGS.md
	gitbook build
	git checkout -- LANGS.md
	chromium-browser _book/index.html

read-pdf:
	evince book.pdf

read: read-html

read-html:
	chromium-browser _book/index.html

clean:
	@rm -rf _book

distclean: clean
	@rm book.pdf
