#!/usr/bin/env bash

colors=("rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender")

flavors=("macchiato" "mocha" "frappe" "latte")

mkdir -p dist

for flavor in ${flavors[@]}; do
  for color in ${colors[@]}; do
    echo "Building $flavor-$color"
    sass --style=compressed src/flavors/${flavor}/${color}.scss dist/${flavor}-${color}.css
  done
done

rm dist/*.css.map
