#!/bin/bash
multTable() {
  num=$1
  clear
  distanceX=2
  distanceY=4
  tput setaf 1
  tput bold
  for x in $(seq 1 $num); do
    tput cup 0 $distanceY
    echo $x
    tput cup $distanceX 0
    echo $x
    distanceX=$(expr $distanceX + 2)
    distanceY=$(expr $distanceY + 4)
  done
  tput sgr0
  distanceX=2
  distanceY=4

  for coluna in $(seq 1 $num); do
    for linha in $(seq 1 $num); do
      tput sgr0
      if [ "$linha" -eq "$coluna" ]; then
        tput smul
      fi
      mult=$(expr $linha \* $coluna)
      tput cup $distanceX $distanceY
      echo $mult
      distanceX=$(expr $distanceX + 2)
      if [ "$linha" -eq "$coluna" ]; then
        tput smul
      else
        tput sgr0
      fi
    done
    distanceX=2
    distanceY=$(expr $distanceY + 4)
  done
}
multTable $1
