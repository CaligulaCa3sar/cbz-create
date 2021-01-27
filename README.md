# create-cbz
A Bash script that zips up multiple folders containing image files (extensions .jpg, .jpeg, .gif or .png) into .cbz archives.

## Installation:
Put the script file anywhere you like, make sure it's executable and away you go!
Personally, I like to put custom scripts in /opt/scripts and then create symlinks in /usr/local/bin, making sure that location is included in PATH.

```bash
$ sudo cp -p create-cbz.sh /opt/scripts/create-cbz.sh
$ sudo chmod 755 /opt/scripts/create-cbz.sh
$ sudo ln -s /opt/scripts/create-cbz.sh /usr/local/bin/create-cbz
```

## Usage:
Either
```bash
$ <path>/create-cbz.sh [<directory>...]
```
or
```bash
$ create-cbz [<directory>...]
```
depending on your installation location and method as per the [Installation](#Installation) section above. Examples from here on will assume the second version.
Can be used in a number of ways.
### Explicit Folder Locations
```bash
$ create-cbz ~/Pictures/Example\ Comic
```
Assuming that `~/Pictures/Example\ Comic` is a folder containing images, it creates the output file `Example Comic.cbz` in `~/Pictures`.
### Globbed
```bash
$ ls ~/Pictures
Beach/          Manga 1/          Manga 2/
Miscellaneous/  Unsorted/
$ create-cbz ~/Pictures/Manga*/
```
Using Bash expansion, this example would create .cbz files of folders at `~/Pictures` from any sub-folders that have names beginning with "Manga" and name them accordingly.
### Without Arguments
```bash
$ cd ~/Pictures
$ ls
Beach/          Manga 1/          Manga 2/
Miscellaneous/  Unsorted/
$ create-cbz
```
Running the script without arguments will cause it to attempt to create .cbz files of **every sub-directory at your current location**. As this could potentially be messy if done by accident, the script will first prompt you to confirm that you meant to run it without arguments before attempting to do so.
