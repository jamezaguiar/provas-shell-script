#!/bin/bash
mkdir teste
for i in $(seq 10); do
  ano=$(shuf -e 200{1..9} 201{0..8} | tail -n 1)
  mes=$(shuf -e 0{1..9} 10 11 12 | tail -n 1)
  dia=$(shuf -e 0{1..9} 1{0..9} 2{0..9} 30 | tail -n 1)
  touch -m -t ${ano}${mes}${dia}0000 teste/arquivo$i.txt
done
