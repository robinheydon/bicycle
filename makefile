all : book.html book.pdf

clean :
	rm book.all book.html book.pdf

book.html : book.all
	pandoc -o book.html book.all

book.pdf : book.all
	pandoc -o book.pdf book.all

book.all : book.mdpp
	markdown-pp -o book.all book.mdpp

book.mdpp : book.md chapter0.md chapter1.md
