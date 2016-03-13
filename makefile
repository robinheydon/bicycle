all : book.html book.pdf

CHAPTERS=${wildcard *.md}

clean :
	rm book.all book.html book.pdf

book.html : book.all
	pandoc -o book.html book.all

book.pdf : book.all
	pandoc -o book.pdf book.all

book.all : book.mdpp book.md $(CHAPTERS)
	markdown-pp -o book.all book.mdpp

