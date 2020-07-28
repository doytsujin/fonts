#!/bin/bash

cd "$(dirname "$0")"

repo="tonsky/FiraCode"
source "../../scripts/update-github.sh"

curfiles=()
for i in *.woff2; do
  curfiles+=("woff2/$(basename $i)")
done
7z -y e -o"." "$file" "${curfiles[@]}"
7z -y e -o"." "$file" 'ttf/*-Retina.ttf'
woff2_compress *-Retina.ttf
rm *-Retina.ttf

echo "$tag" > ".tag"

source "../../scripts/update-commit.sh"
