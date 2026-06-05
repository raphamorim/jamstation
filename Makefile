JAM ?= jam
BIN := jamstation

# SDL2 locations differ per platform. Override SDL_LIB/SDL_INC on the
# command line to point at a non-default install (e.g. /usr/local on
# Intel macOS).
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    SDL_LIB ?= /opt/homebrew/lib
    SDL_INC ?= /opt/homebrew/include
    RUN_ENV := DYLD_LIBRARY_PATH=$(SDL_LIB)
    # libobjc: sdl.jam's disableAppNap() calls the ObjC runtime to switch off
    # macOS App Nap (which otherwise stalls the emulator when the window is
    # unfocused). The call is @isDarwin()-guarded, so -lobjc is Darwin-only.
    OBJC_LIB := -lobjc
else
    SDL_LIB ?= /usr/lib
    SDL_INC ?= /usr/include
    RUN_ENV := LD_LIBRARY_PATH=$(SDL_LIB)
    OBJC_LIB :=
endif

# The installed `jam` auto-discovers its std/ (via $PREFIX/lib/jam/std),
# so only SDL needs to be on the library path.
BUILD_ENV := LIBRARY_PATH=$(SDL_LIB)

.PHONY: test build run release run-release clean fmt

test:
	$(BUILD_ENV) $(JAM) test tests.jam

build:
	$(BUILD_ENV) $(JAM) -lSDL2 $(OBJC_LIB) -o $(BIN) main.jam

release:
	$(BUILD_ENV) $(JAM) -C opt-level=3 -lSDL2 $(OBJC_LIB) -o $(BIN) main.jam

run: build
	$(RUN_ENV) ./$(BIN)

run-release: release
	$(RUN_ENV) ./$(BIN)

clean:
	rm -f $(BIN)
