CC=clang
CFLAGS=-Wall -Werror -g
OUT=bin
SOURCES=$(wildcard *.c)
HEADERS=$(wildcard *.h)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))

all: $(OUT)

r: run
run: $(OUT)
	./$(OUT)

d: dbg
dbg: $(OUT)
	gdb --silent $(OUT)

$(OUT): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(OUT) $(OBJECTS)


main.o: main.c $(HEADERS)
	$(CC) $(CFLAGS) -c main.c


%.o: %.c 
	$(CC) $(CFLAGS) -c $^
	

c: clean
clean:
	rm *.o $(OUT)

v: vars
vars:
	@echo "CC     : "$(CC)
	@echo "CFLAGS : "$(CFLAGS)
	@echo "OUT    : "$(OUT)
	@echo "SOURCES: "$(SOURCES)
	@echo "HEADERS: "$(HEADERS)
	@echo "OBJECTS: "$(OBJECTS)

h: help
help:
	@echo "make help"
	@echo "make vars"
	@echo "make clean"
	@echo "make all"
	@echo "make run"
	@echo "make dbg"

