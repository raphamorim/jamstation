# JamStation: PSOne Emulator written in Jam

A PlayStation 1 emulator written in [Jam Programming Language](https://github.com/raphamorim/jam). It uses SDL2 for rendering.

Passes [JaCzekanski/ps1-tests](https://github.com/JaCzekanski/ps1-tests).

Kindly reminder that Jam lang is experimental yet.

```bash
# LIBRARY_PATH should be where SDL2 is located
LIBRARY_PATH=/opt/homebrew/lib jam -lSDL2 -C opt-level=3 -o jamstation main.jam

# Run: jamstation <BIOS_PATH> [GAME_PATH]
./jamstation /path/to/SCPH1001.BIN "/path/to/Brave Fencer Musashi (USA).cue"

# BIOS only — boots to the PlayStation shell:
./jamstation /path/to/SCPH1001.BIN
```

- **`BIOS_PATH`** — the PSX BIOS image.
- **`GAME_PATH`** — optional, dispatched by extension:
  - `.cue` / `.bin` — disc image; the BIOS bootstraps it off the disc. Pass the **`.cue`**, not the game folder — its `.bin` tracks are resolved relative to the cue (multi-track and spaces in the name are fine, so quote paths with spaces).
  - `.exe` — a PS-X executable, sideloaded after the BIOS boots.

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
