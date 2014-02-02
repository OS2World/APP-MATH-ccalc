# -*- makefile -*-
# Makefile for Unix with gcc compiler

CC=gcc
# if you use egcs-2.90.* version of GCC please add option -fno-exceptions 
# to reduce code size and increase performance

# Debug version
#CFLAGS = -c -Wall -O0 -g 

# Optimized version
CFLAGS = -c -Wall -O6 -g

# Optimized version with switched off asserts
#CFLAGS = -c -Wall -O6 -g -DNDEBUG

LFLAGS=-g

all: ccalc

ccalc.o: ccalc.cpp ccalc.h
	$(CC) $(CFLAGS) ccalc.cpp

ccalc: ccalc.o
	$(CC) $(LFLAGS) -o ccalc ccalc.o -lm

clean: 
	rm -f  *.o *.exe core *~ *.his ccalc


tgz: clean
	cd ..; tar cvzf ccalc.tgz ccalc

copytgz: tgz
	mcopy -o ../ccalc.tgz a:

