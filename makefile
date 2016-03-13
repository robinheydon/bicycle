all : book.pdf

CHAPTERS=${wildcard *.md}

clean :
	rm book.all book.pdf book_html.all book.html

book.pdf : book.html makefile
	wkhtmltopdf book.html book.pdf

book.html : book.all makefile head.part tail.part
	markdown_py -v -o html5 -f book_html.all book.all
	cat head.part book_html.all tail.part > book.html

book.all : book.mdpp book.md $(CHAPTERS) makefile
	markdown-pp -o book.all book.mdpp

