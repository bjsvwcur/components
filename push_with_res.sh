#!/bin/bash

# Erstellt von allen *.puml Diagrammdefinitionen in ../diagrams die PNG-Grafiken in ../doc/dia
# und führt für die png's das git add, commit und anschliessend für alle pendenten Aenderungen das git push aus.

rm ./doc/dia/*

FILES=./diagrams/*
for f in $FILES
do
  echo "****************** Processing $f ***********************************************************"
  
  name_suffix=$(echo $f | cut -d/ -f3) # split filepath with delimiter /, and pick 3rd element of result array
  name=$(echo $name_suffix | cut -d. -f1) # split filename with delimiter ., and pick first element of result array
  out=./doc/dia/${name}.png

  cat $f | docker run --rm -i puml_burner > $out
done

git add ./doc/dia/*
git commit -m 'Script: Auto added burned diagrams'
git push
