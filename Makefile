#Makefile
CC = gcc
CFLAGS = -std=c99
CPPFLAGS = -Isrc/
LDLIBS = -lcriterion

BIN = search-combinations

OBJS = $(addprefix src/, ) #TODO
TEST_OBJS = $(addprefix tests/, ) #TODO

all: $(BIN)

$(BIN): src/main.o $(OBJS)
	$(CC) -o $@ $^

testsuite: $(OBJS) $(TEST_OBJS)
	$(CC) -o $@ $(LDLIBS) $^

check: testsuite
	./testsuite

clean:
	rm -f $(BIN) $(OBJS) $(TEST_OBJS) src/main.o testsuite

.PHONY: all check clean