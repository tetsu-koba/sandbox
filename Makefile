RM	= rm -rf
RM_CMD	= $(RM) *.BAK core errs ,* *~

TOPDIR	= .

CFLAGS	+= -O2
CFLAGS	+= -fno-strength-reduce
CFLAGS	+= -Wall

CSRCS	+= $(shell ls *.c)
OBJS	= $(CSRCS:.c=.o)
PRGS	= $(OBJS:.o=)
DOBJS	= $(CSRCS:.c=-debug.o)
DPRGS	= $(DOBJS:.o=)

vpath %.c    $(TOPDIR)

all:	$(OBJS) $(PRGS) cleanup

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
%: %.o
	$(CC) -o $@ $<

debug:	$(DOBJS) $(DPRGS)

%-debug.o: %.c
	$(CC) -g -c $(CFLAGS) $< -o $@
%-debug: %-debug.o
	$(CC) -g -o $@ $<

cleanup:
	$(RM_CMD) "#"*

clean:	cleanup
	$(RM) *.o

distclean: clean
	$(RM) $(PRGS) $(DPRGS) *.exe

