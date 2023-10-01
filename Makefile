# Makefile for f2023, ecs36b
# myHeal, myBreak, myDiff

CC = gcc

CFLAGS = -g

# rules.
all: 	myBreak myHeal myDiff

#
#

myBreak.o:	myBreak.c
	$(CC) -c $(CFLAGS) myBreak.c

myHeal.o:	myHeal.c
	$(CC) -c $(CFLAGS) myHeal.c

myDiff.o:	myDiff.c
	$(CC) -c $(CFLAGS) myDiff.c

myBreak:	myBreak.o
	$(CC) myBreak.o -o myBreak

myHeal:		myHeal.o
	$(CC) myHeal.o -o myHeal

myDiff:		myDiff.o
	$(CC) myDiff.o -o myDiff

clean:
	rm -f *.o *~ core myBreak myHeal myDiff

