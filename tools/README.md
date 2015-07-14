
# Mediawiki to Markdown Conversion

The mediawiki-2-markdown.sh can be used to download a mediawiki page and
convert it to a markdown file.

## Usage

By default, the site is configured as elinux.org, if want to download a
mediawiki page from another website, please configure the `from` variable in
mediawiki-2-markdown.sh at first.

### Install them

    $ cp mediawiki-2-markdown.sh m2m.sh /usr/bin/
    $ chmod a+x /usr/bin/{m2m.sh,mediawiki-2-markdown.sh}

### Download/Update and Convert one page

    $ mediawiki-2-markdown.sh Boot_Time

    or

    $ m2m.sh Boot_Time

### Download/Update and Convert several pages

    $ cd en/dev_portals/
    $ ls *.md | grep -v README.md | xargs -i m2m.sh {}

### Download/Update and Convert subpages

    $ cd en/dev_portals/Boot_Time/
    $ ../../../tools/m2m-subpage.sh

### Build the table of content for a specified markdown file

    $ cd en/dev_portals/Boot_Time/
    $ ../../../tools/build-toc.sh Boot_Time.md
