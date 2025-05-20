CFLAGS=-g -O2 -Wall -DNDEBUG $(OPTFLAGS)
LIBS=-ldl $(OPTLIBS)

SOURCES=$(wildcard src/**/*.c src/*.c)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))

TARGET=bin/greet

all: $(TARGET)

dev: CFLAGS=-g -Wall $(OPTFLAGS)
dev: all

$(TARGET): bin $(OBJECTS)
	$(CC) -o $@ $(OBJECTS)

bin:
	@mkdir -p bin

clean:
	rm -rf bin $(OBJECTS)

install: all
	install -d $(OUTDIR)/bin/
	install $(TARGET) $(OUTDIR)/bin/
