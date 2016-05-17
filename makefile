ALLPARTS=${wildcard *.md}

all : book.pdf

clean : 
	rm -f book.html
	rm -f book.pdf

book.pdf : $(ALLPARTS) book.css book.md head.inc foot.inc makefile
	echo "Compiling book.html"
	markdown-pp book.md | markdown_py -x markdown.extensions.toc -x markdown.extensions.smarty -o html5 -f book_inside.html
	cat head.inc book_inside.html foot.inc > book.html
	rm -f book_inside.html
	echo "Compiling book.pdf"
	prince book.html -s book.css -o book.pdf
	echo "Done"
