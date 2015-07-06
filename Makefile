
all:
	gitbook build

pdf:
	gitbook pdf

clean:
	rm -rf _book/ book_*.pdf
