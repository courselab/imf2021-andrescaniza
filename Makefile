decode : libdecrypt.so decode.o libcypher.so
	gcc -m32 decode.o -L. -Wl,-rpath='$$ORIGIN' -l:libdecrypt.so -l:libcypher.so -o decode

bypass.o : bypass.c
	gcc -c -m32 $< -o $@

fix.o : fix.S
	as -32 $< -o $@

libdecrypt.so : bypass.o fix.o
	gcc -m32 --shared $^ -o $@

clean: 
	rm -f decode bypass.o fix.o libdecrypt.so

DISTNAME=decode-fixed

dist :
	make clean
	rm -rf $(DISTNAME) ; mkdir $(DISTNAME)
	cp *.o *.so *.c *.S Makefile $(DISTNAME)
	tar zcvf $(DISTNAME).tar.gz $(DISTNAME)
