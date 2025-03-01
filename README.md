[![CI](https://github.com/humbertodias/sdl-nugem/actions/workflows/ci.yml/badge.svg)](https://github.com/humbertodias/sdl-nugem/actions/workflows/ci.yml)
[![CD](https://github.com/humbertodias/sdl-nugem/actions/workflows/cd.yml/badge.svg)](https://github.com/humbertodias/sdl-nugem/actions/workflows/cd.yml)
![GitHub all releases](https://img.shields.io/github/downloads/humbertodias/sdl-nugen/total)

# Nugem

**nugem** is a 2D fighting game engine reimplementing M.U.G.E.N. using SDL2 and OpenGL aiming for compatibility with [Mugen](https://en.wikipedia.org/wiki/Mugen_(game_engine)).

## Prequirements
* g++ 14+
* clang 16+
* cmake 3+
* sdl2
* freeglut 3+
* glew
* gl
* glm

## Dependencies
#### Ubuntu

```shell
sudo apt install libsdl2-dev libsdl2-image-dev freeglut3-dev libglew-dev libglm-dev cmake g++ doxygen
```

#### OSX

```shell
brew install sdl2 sdl2_image freeglut glew glm doxygen
```

## How to run

```shell
make build run
```

## Reference

### Mugen file compatibility

* [Elecbyte wiki on the Internet Archive](https://web.archive.org/web/20150613185024/http://elecbyte.com/wiki/index.php/Main_Page)
* [Resources from the official MUGEN builds](https://mugenarchive.com/forums/downloads.php?do=cat&id=39-mugen-builds)

### WGPU

* [WGPU tutorial](https://sotrh.github.io/learn-wgpu/)
* [Shaders: WGSL reference](https://www.w3.org/TR/WGSL/)
* [WebGPU API reference](https://gpuweb.github.io/gpuweb/#enumdef-gpufiltermode)

