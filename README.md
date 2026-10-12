# Friday Night Funkin': Interspecies Engine
A Friday Night Funkin' engine that ports the last version before V-Slice (v0.2.8) and its HaxeFlixel version (v4.9.0) to [LÖVE 11.5](https://love2d.org) and adapts it to the engine's vision.

## Features

*This engine does not and will not contain any V-Slice content or behavior in the engine, but its modding features may be implemented in the engine, as long as they are not contradictory to the engine's vision.* Those features include:

- Character animations having their own sprite sheets
- Proper Animate Atlas support (Regular exports, optimized exports, or [BetterTextureAtlas](https://github.com/Dot-Stuff/BetterTextureAtlas) exports)

[*For an alternative that adapts Friday Night Funkin' to LÖVE but more specifically like V-Slice, FNF-LÖVE is that.*](https://github.com/stilic/FNF-LOVE)

Other planned features are:

- Scripting system
  - Lua API will not rely on Reflect functions
- Modding system
  - `mods/`: One mod at a time
  - `addons/`: Multiple can be enabled
  - Custom options
- ArrowVortex-like chart editor
  - Import from other engines
    - Vanilla (<= v0.2.8)
    - Psych Engine
    - FPS Plus
    - Andromeda Engine
    - Codename Engine

## Libraries
- [30log](https://github.com/Yonaba/30log/blob/master/30log-clean.lua)\*
- [hump/gamestate](https://github.com/vrld/hump/blob/master/gamestate.lua)\*
- [tick](https://github.com/bjornbytes/tick/blob/master/tick.lua)
- [json.lua](https://github.com/rxi/json.lua/blob/master/json.lua)
- [baton](https://github.com/tesselode/baton/blob/master/baton.lua)

`*` represents that the library has been modified for use of the engine.

## References
These links are the references the engine is going to use.

[Friday Night Funkin' Code - Last Commit on April 18, 2021](https://github.com/FunkinCrew/Funkin/tree/56cbb276fa1f94d3641dfe7affe6e56b3ada784a)

[Friday Night Funkin' Assets - Last Commit on April 18, 2021](https://github.com/FunkinCrew/funkin.assets/tree/6e5f52f1b4dad2588d64b4af8229a6e90de66ea4)

[AngelWyvern's Reverse Engineered Code](https://github.com/AngelWyvern/FNF-NewgroundsPort)

[HaxeFlixel v4.9.0](https://github.com/HaxeFlixel/flixel/tree/4.9.0)
