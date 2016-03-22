all : book.pdf

ALLPARTS=${wildcard *.md}

clean :
	rm book.all book.pdf book_html.all book.html

book.pdf : book.html makefile book.css
	@echo : converting book.html to book.pdf
	@prince book.html -o book.pdf
	@echo done.

book.html : book.all makefile head.inc tail.inc
	@echo : converting markdown source to book.html
	@markdown_py -x markdown.extensions.toc -x markdown.extensions.smarty -o html5 -f book_html.all book.all
	@cat head.inc book_html.all tail.inc > book.html

book.all : book.mdpp $(ALLPARTS) makefile
	@echo : preprocessing book.mdpp
	@markdown-pp -o book.all book.mdpp

