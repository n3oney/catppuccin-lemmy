#!/usr/bin/env bash

colors=("rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender")

flavors=("macchiato" "mocha" "frappe" "latte")

pids=()

mkdir -p dist

for flavor in ${flavors[@]}; do
  echo "Building $flavor..."
  for color in ${colors[@]}; do
    sass --no-source-map --style=compressed src/flavors/${flavor}/${color}.scss dist/${flavor}-${color}.css &
    pids+=($!)
  done

  for pid in "${pids[@]}"; do
    wait $pid
  done

  pids=()
done