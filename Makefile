NAME=chgems
VERSION=0.3.3
AUTHOR=postmodern
URL=https://github.com/$(AUTHOR)/$(NAME)

DIRS=etc lib bin sbin share
INSTALL_DIRS=`find $(DIRS) -type d 2>/dev/null`
INSTALL_FILES=`find $(DIRS) -type f 2>/dev/null`
DOC_FILES=*.md *.txt

PKG_DIR=pkg
PKG_NAME=$(NAME)-$(VERSION)
PKG=$(PKG_DIR)/$(PKG_NAME).tar.gz
SIG=$(PKG).asc

PREFIX?=/usr/local
DOC_DIR=$(PREFIX)/share/doc/$(PKG_NAME)

pkg:
	mkdir -p $(PKG_DIR)

$(PKG): pkg
	git archive --output=$(PKG) --prefix=$(PKG_NAME)/ HEAD

share/man/man1/chgems.1: doc/man/chgems.1.md
	kramdown-man doc/man/chgems.1.md > share/man/man1/chgems.1

man: share/man/man1/chgems.1
	git commit -m "Updated the man pages" doc/man/chgems.1.md share/man/man1/chgems.1

build: $(PKG)

download: pkg
	wget -O $(PKG) $(URL)/archive/v$(VERSION).tar.gz

$(SIG): $(PKG)
	gpg --sign --detach-sign --armor $(PKG)
	git add $(SIG)
	git commit $(SIG) -m "Added PGP signature for v$(VERSION)"
	git push

sign: $(SIG)

verify: $(PKG) $(SIG)
	gpg --verify $(SIG) $(PKG)

clean:
	rm -f $(PKG) $(SIG)

all: $(PKG) $(SIG)

test:
	SHELL=`which bash` ./test/runner
	SHELL=`which zsh` ./test/runner

tag:
	git push
	git tag -s -m "Tagging $(VERSION)" v$(VERSION)
	git push --tags

release: tag download sign

install:
	for dir in $(INSTALL_DIRS); do install -d $(PREFIX)/$$dir; done
	for file in $(INSTALL_FILES); do install $$file $(PREFIX)/$$file; done
	install -d $(DOC_DIR)
	cp -r $(DOC_FILES) $(DOC_DIR)/

uninstall:
	for file in $(INSTALL_FILES); do rm -f $(PREFIX)/$$file; done
	rm -rf $(DOC_DIR)

.PHONY: build man download sign verify clean test tag release install uninstall all
