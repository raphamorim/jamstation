# JamStation: PSOne Emulator written in Jam

A PlayStation 1 emulator written in [Jam Programming Language](https://github.com/raphamorim/jam). It uses SDL2 for rendering.

Passes [JaCzekanski/ps1-tests](https://github.com/JaCzekanski/ps1-tests).

Kindly reminder that Jam lang is experimental yet.

```bash
# LIBRARY_PATH should be where SDL2 is located
LIBRARY_PATH=/opt/homebrew/lib jam -lSDL2 -C opt-level=3 -o jamstation main.jam

# Run the emulator
./jamstation BIOS_PATH GAME_PATH
```

Note: You need to use the `.cue` path instead of the game root folder like `/Users/rapha/Desktop/BraveFencerMusashi/game.cue`.

## Controls

Keyboard maps to a digital PSX controller in slot 1:

| PSX button | Key       |
|------------|-----------|
| D-pad ↑    | Up arrow  |
| D-pad ↓    | Down arrow|
| D-pad ←    | Left arrow|
| D-pad →    | Right arrow|
| ╳ Cross    | Z         |
| ◯ Circle   | X         |
| ▢ Square   | A         |
| △ Triangle | S         |
| L1         | Q         |
| R1         | W         |
| L2         | 1         |
| R2         | 2         |
| Start      | Return    |
| Select     | Right Shift |
| Quit       | Esc       |
