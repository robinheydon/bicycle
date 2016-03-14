all : book.pdf

ALLPARTS=${wildcard *.md}

clean :
	rm book.all book.pdf book_html.all book.html

book.pdf : book.html makefile book.css
	prince --no-network book.html -o book.pdf

book.html : book.all makefile head.inc tail.inc
	markdown_py -v -x markdown.extensions.toc -x markdown.extensions.smarty -o html5 -f book_html.all book.all
	cat head.inc book_html.all tail.inc > book.html

book.all : book.mdpp $(ALLPARTS) makefile
	markdown-pp -o book.all book.mdpp

