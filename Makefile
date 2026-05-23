# todo: I need to update it before make public
JAM      := ../jam/output/jam.out
SDL_LIB  := /opt/homebrew/lib
SDL_INC  := /opt/homebrew/include
BIN      := jamstation

# macOS: SDL2 is installed via brew under /opt/homebrew. Override these
# paths for /usr/local (Intel macOS) or /usr (Linux).
LIBPATH := $(SDL_LIB)

.PHONY: test build run release clean fmt

test:
	$(JAM) test tests.jam

build:
	LIBRARY_PATH=$(LIBPATH) $(JAM) -lSDL2 -o $(BIN) main.jam

release:
	LIBRARY_PATH=$(LIBPATH) $(JAM) --release -lSDL2 -o $(BIN) main.jam

run: build
	DYLD_LIBRARY_PATH=$(LIBPATH) ./$(BIN)

run-release: release
	DYLD_LIBRARY_PATH=$(LIBPATH) ./$(BIN)

clean:
	rm -f $(BIN)
