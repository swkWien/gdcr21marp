# GDCR21 Slides via Marp

A temporary repository for discussion and experimentation.


## Installation

### VS Code Plugin

There is a [VS Code plugin](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)
for local development and building.

### Marp CLI

There is a [CLI that can be installed through npm](https://www.npmjs.com/package/@marp-team/marp-cli).

```console
$ npm install -g @marp-team/marp-cli
```

To convert a markdown file into e.g. html, do

```console
$ marp slides.md -o slides.html
$ npx @marp-team/marp-cli@latest slides.md -o slides.html  # included marp update
```

Alternatively, you can use the Makefile and run

```console
$ make all  # to build all targets
$ make clean  # to remove all builds
```
## Syntax

https://marpit.marp.app/image-syntax
