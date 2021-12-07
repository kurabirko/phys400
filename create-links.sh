#!/bin/bash

# To retain portability between macos and linux, use bash 3
docs=('proposal' 'interim' 'final' 'poster')
links=( 'common:common' 'vscode:.vscode' )

for doc in "${docs[@]}"; do
  for i in "${links[@]}"; do
    source="../../shared/${i%%:*}"
    target="documents/$doc/${i##*:}"

    mkdir -p $target
    ln -s $source $target
  done
done

