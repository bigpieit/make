#!/bin/bash

rm -rf lib* *.o hello_*

gcc -fPIC -c -o hello.o hello.c -I.
 
ar crv -o libmyhello_s.a hello.o

gcc -o hello_static main.c -L. -lmyhello_s

./hello_static
