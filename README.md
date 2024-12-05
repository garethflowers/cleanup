# CleanUp Script

Script to remove old files from a directory until a specified amount of free
space is achieved.

## Usage

```sh
./cleanup.sh directory percentage
```

For example - delete files from the `/tmp` directory until disk uasge is 99% or
less.

```sh
./cleanup.sh /tmp 99
```
