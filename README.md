# Marooned

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

Print the list of files from a specific directory. This can be useful if
you are sharing files with another project.

```sh
$ marooned --project Foo.xcodeproj --directory path/to/source/files
```

## Installation

```sh
brew install keith/formulae/marooned
```
