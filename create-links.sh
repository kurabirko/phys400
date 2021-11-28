#!/bin/sh

COMMON_DIR="common"

for dir in src/*; do
  if [ "$dir" != "src/$COMMON_DIR" -a $dir != "src/build" ]; then
    ln -s "../$COMMON_DIR" "$dir/$COMMON_DIR"
  fi
done
