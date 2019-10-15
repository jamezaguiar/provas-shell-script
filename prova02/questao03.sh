#!/bin/bash
gerarVetor() {
  tamanhoVetor=$1
  declare -a vetor
  for x in $(seq 0 $(expr $tamanhoVetor - 1)); do
    vetor[$x]=$RANDOM
  done
  echo "Vetor aleatório: ${vetor[@]}"
  printf "\n"

  bubbleSort $tamanhoVetor
  printf "\n"

  echo "Ordenando com QuickSort..."
  inicio_qs=$(date +%s)
  quickSort 0 $(expr $tamanhoVetor - 1)
  fim_qs=$(date +%s)
  duracao_qs=$(expr $fim_qs - $inicio_qs)
  echo "Vetor ordenado com QuickSort: ${vetor[@]}"
  if [ "$duracao_qs" -le 1 ]; then
    echo "Duração da ordenação QuickSort: $duracao_qs segundo"
  else
    echo "Duração da ordenação QuickSort: $duracao_qs segundos"
  fi
}

bubbleSort() {
  declare -a vetorBubble
  for i in $(seq 0 $(expr $1 - 1)); do
    vetorBubble[$i]=${vetor[$i]}
  done

  s1=$(expr $1 - 1)
  s2=$(expr $1 - 2)
  echo "Ordenando com BubbleSort..."
  inicio_bs=$(date +%s)
  for i in $(seq 0 $s1); do
    for j in $(seq 0 $s2); do
      jaux=$(expr $j + 1)
      if [ "${vetorBubble[$j]}" -gt "${vetorBubble[$jaux]}" ]; then
        temp=${vetorBubble[$j]}
        vetorBubble[$j]=${vetorBubble[$jaux]}
        vetorBubble[$jaux]=$temp
      fi
    done
  done
  fim_bs=$(date +%s)
  duracao_bs=$(expr $fim_bs - $inicio_bs)

  echo "Vetor ordenado com BubbleSort: ${vetorBubble[@]}"
  if [ "$duracao_bs" -le 1 ]; then
    echo "Duração da ordenação BubbleSort: $duracao_bs segundo"
  else
    echo "Duração da ordenação BubbleSort: $duracao_bs segundos"
  fi
}

quickSort() {
  esq=$1
  dir=$2

  if [ "$1" -lt "$2" ]; then
    pivo=${vetor[$1]}

    while [ "$esq" -lt "$dir" ]; do

      while [ "${vetor[$esq]}" -le "$pivo" -a "$esq" -lt "$2" ]; do
        esq=$(expr $esq + 1)
      done

      while [ "${vetor[$dir]}" -gt "$pivo" ]; do
        dir=$(expr $dir - 1)
      done

      if [ "$esq" -lt "$dir" ]; then
        aux=${vetor[$esq]}
        vetor[$esq]=${vetor[$dir]}
        vetor[$dir]=$aux
      fi

    done

    aux=${vetor[$dir]}
    vetor[$dir]=${vetor[$1]}
    vetor[$1]=$aux
    aux=$dir

    quickSort $1 $(expr $dir - 1)
    quickSort $(expr $aux + 1) $2
  fi
}

tamVetor=$1
gerarVetor $tamVetor
