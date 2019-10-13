#!/bin/bash
multTable() {
  num=$1
  clear
  distanceX=1
  distanceY=1
  for coluna in $(seq 1 $num); do
    for linha in $(seq 1 $num); do
      tput sgr0
      if [ "$linha" -eq "$coluna" ]; then
        tput smul
      else
        tput sgr0
      fi
      if [ "$coluna" -eq 1 ]; then
        tput bold
        tput setaf 1
        mult=$(expr $linha \* $coluna)
        tput cup $distanceX $distanceY
        echo $mult
        distanceX=$(expr $distanceX + 2)
      else
        if [ "$linha" -eq 1 ]; then
          tput bold
          tput setaf 1
        else
          if [ "$linha" -eq "$coluna" ]; then
            tput smul
          else
            tput sgr0
          fi
        fi
        mult=$(expr $linha \* $coluna)
        tput cup $distanceX $distanceY
        echo $mult
        distanceX=$(expr $distanceX + 2)

      #else
      #tput rmul
      fi
    done
    distanceX=1
    distanceY=$(expr $distanceY + 4)
  done
}
multTable $1
