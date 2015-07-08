
# Mediawiki to Markdown Conversion

The mediawiki-2-markdown.sh can be used to download a mediawiki page and
convert it to a markdown file.

## Usage

By default, the site is configured as elinux.org, if want to download a
mediawiki page from the other website, please configure the `from` variable in
mediawiki-2-markdown.sh at first.

### Download and Convert one page

    $ mediawiki-2-markdown.sh Boot_Time

    or

    $ m2m.sh Boot_Time

### Download and Convert several pages

    $ cd /path/to/a/directory/
    $ ls *.md | grep -v README.md | sed -e "s/.md//g" | xargs -i m2m {}
