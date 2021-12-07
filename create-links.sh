#!/bin/bash

# To retain portability between macos and linux, use bash 3
docs=('proposal' 'interim' 'final' 'poster')
links=( 'common:common' 'vscode:.vscode' )

for doc in "${docs[@]}"; do
  for i in "${links[@]}"; do
    source="../../shared/${i%%:*}"
    target="documents/$doc/"
    link="${i##*:}"

    if [ -d "$target"]; then
      mkdir -p "$target"
      echo "created directory: $target"
    fi

    ln -s $source "$target/$link"
    echo "created link $source at $target/$link"
  done
done

