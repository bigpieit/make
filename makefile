CC = gcc
IDIR = ./include
LDIR = ./lib
SDIR = ./src
ODIR = $(SDIR)/obj
DEPS = $(IDIR)/hello.h

BIN = ./bin

$(ODIR)/%.o : $(SDIR)/%.c $(DEPS)
	gcc -fPIC -c -o ./src/obj/hello.o ./src/hello.c -I./include
	gcc -fPIC -c -o ./src/obj/main.o ./src/main.c -I./include
	#$(CC) -c -fPIC -o $@ $< -I$(IDIR)

$(LDIR)/libmyhello.a : $(ODIR)/hello.o
	ar crv -o ./lib/libmyhello_s.a ./src/obj/hello.o
	#ar crv $@ $<

$(BIN)/hello_static : $(ODIR)/main.o
	gcc -o ./bin/hello_static ./src/obj/main.o -L./lib -lmyhello_s -I./include
	#gcc -o ./bin/hello_static ./src/main.c -L./lib -lmyhello

#$(BIN)/hello_static : $(SDIR)/main.c
#	$(CC) -o $(BIN)/hello_static $(SDIR)/main.c -L$(LDIR) -lmyhello

#$(LDIR)/libmyhello_d.so : $(ODIR)/hello.o
#	$(CC) -shared -fPIC -o $(LDIR)/libmyhello_d.so $(ODIR)/hello.o
#	echo "reach lib.so"


.PHONY: default clean

default : all
clean :
	rm -rf $(ODIR)/*.o $(LDIR)/* ./bin/*

