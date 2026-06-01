JAM := ../jam/output/jam.out
BIN := jamstation

# SDL2 locations differ per platform. Override SDL_LIB/SDL_INC on the
# command line to point at a non-default install (e.g. /usr/local on
# Intel macOS).
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    SDL_LIB ?= /opt/homebrew/lib
    SDL_INC ?= /opt/homebrew/include
    RUN_ENV := DYLD_LIBRARY_PATH=$(SDL_LIB)
else
    SDL_LIB ?= /usr/lib
    SDL_INC ?= /usr/include
    RUN_ENV := LD_LIBRARY_PATH=$(SDL_LIB)
endif

# Point at the std/ directory in the in-tree jam build. The installed
# jam binary auto-discovers std/ via $PREFIX/lib/jam/std, but the dev
# layout (../jam/output/jam.out + ../jam/std) needs an explicit hint.
JAM_STD ?= ../jam/std
BUILD_ENV := LIBRARY_PATH=$(SDL_LIB) JAM_STD_PATH=$(JAM_STD)

.PHONY: test build run release run-release clean fmt

test:
	$(BUILD_ENV) $(JAM) test tests.jam

build:
	$(BUILD_ENV) $(JAM) -lSDL2 -o $(BIN) main.jam

release:
	$(BUILD_ENV) $(JAM) -C opt-level=3 -lSDL2 -o $(BIN) main.jam

run: build
	$(RUN_ENV) ./$(BIN)

run-release: release
	$(RUN_ENV) ./$(BIN)

clean:
	rm -f $(BIN)
