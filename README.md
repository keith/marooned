# Marooned

[![Build Status](https://travis-ci.org/Keithbsmiley/marooned.svg?branch=master)](https://travis-ci.org/Keithbsmiley/marooned)

Marooned is a simple CLI to find files that have been stranded from your
Xcode project file. This has happened to me after resolving merge
conflicts.

## Usage:

Print a list of files not included in the first `.xcodeproj` file found:

```sh
$ marooned
```

Print the list of files for a specific project:

```sh
$ marooned --project Sparrow.xcodeproj
```

## Installation

```sh
brew tap Keithbsmiley/formulae
brew install marooned
```
