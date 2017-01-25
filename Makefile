AS=as
CC=gcc
CFLAGS=-Wall -Wextra -Xlinker power.o

debug:clean
	$(AS) powerMin.s -o power.o
	$(CC) $(CFLAGS) -g -o power main.c
stable:clean
	$(AS) powerMin.s -o power.o
	$(CC) $(CFLAGS) -Os -o power main.c
clean:
	rm -vfr *~ power
	rm -vfr *~ power.o
