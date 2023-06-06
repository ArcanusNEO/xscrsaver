.PHONY: all clean

prefix ?= /usr

CC ?= cc

CPPFLAGS += -O3 -Wall -Wno-unused-function -Wno-unused-value -Wno-unused-variable
CFLAGS +=
LDFLAGS += -lX11

all: xscrsaver-wrapper

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o$@ $^

xscrsaver-wrapper: xscrsaver-wrapper.o
	$(CC) $(CPPFLAGS) $(CFLAGS) -o$@ $^ $(LDFLAGS)

clean:
	rm -rf -- *.o xscrsaver-wrapper

install: xscrsaver-wrapper xscrsaver
	install -Dm755 xscrsaver-wrapper $(prefix)/bin/xscrsaver-wrapper
	install -Dm755 xscrsaver $(prefix)/bin/xscrsaver

uninstall:
	rm -rf $(prefix)/bin/xscrsaver-wrapper 
	rm -rf $(prefix)/bin/xscrsaver