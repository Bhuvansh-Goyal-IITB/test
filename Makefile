CFLAGS=-g -O2 -Wall -DNDEBUG $(OPTFLAGS)
LIBS=-ldl $(OPTLIBS)

SOURCES=$(wildcard src/**/*.c src/*.c)
HEADERS=$(wildcard src/**/*.h src/*.h)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))

TARGET=build/libgreet.a

all: $(TARGET)

dev: CFLAGS=-g -Wall $(OPTFLAGS)
dev: all

$(TARGET): build $(OBJECTS)
	ar rcs $@ $(OBJECTS)
	ranlib $@

build:
	@mkdir -p build

clean:
	rm -rf build outputs result $(OBJECTS)

install: all
	install -d $(OUTDIR)/include/
	install -d $(OUTDIR)/lib/
	install $(TARGET) $(OUTDIR)/lib/
	install $(HEADERS) $(OUTDIR)/include/
