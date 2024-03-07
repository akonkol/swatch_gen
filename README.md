# Swatch Gen
Takes in filament make and model and produces a [filament swatch](https://www.printables.com/model/9657-filament-swatch-card-with-label-fusion-360-file) (with some slight modifications) using [OpenSCAD](https://openscad.org/) 

## Prepare a filament name file (example: paramount-filament-names)
```
Paramount,Iron Red
Paramount,Cadet Blue
.
.
.
```
## Execute helper script
```
./generate_swatches.sh paramount-filament-names
```
If everything worked right, you'll see a bunch of stls in `swatches/`
