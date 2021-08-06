decode : fix.o decode.o libcypher.so bypass.o
	gcc -m32 fix.o bypass.o decode.o -L. -Wl,-rpath='$$ORIGIN' -l:libcypher.so -o decode

bypass.o : bypass.c
	gcc -c -m32 $< -o $@

fix.o : fix.S
	as -32 $< -o $@

clean: 
	rm -f decode bypass.o fix.o

dist :
	tar zcvf decode.tar.gz Makefile *.c *.o *.so *.S decode