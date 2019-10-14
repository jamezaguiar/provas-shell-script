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
  for i in $(seq 0 $(expr $tamanhoVetor - 1)); do
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
  iniVet=$1
  fimVet=$2
  i=$iniVet
  j=$fimVet
  pivo=${vetor[$(echo $iniVet + $fimVet / 2 | bc)]}
  while [ "$i" -le "$j" ]; do
    while [ "${vetor[$i]}" -lt "$pivo" ]; do
      i=$(expr $i + 1)
    done
    while [ "${vetor[$j]}" -gt "$pivo" ]; do
      j=$(expr $j - 1)
    done
    if [ "$i" -le "$j" ]; then
      aux=${vetor[$i]}
      vetor[$i]=${vetor[$j]}
      vetor[$j]=$aux
      i=$(expr $i + 1)
      j=$(expr $j - 1)
    fi
  done
  if [ "$iniVet" -lt "$j" ]; then
    quickSort $iniVet $j
  fi
  if [ "$i" -lt "$fimVet" ]; then
    quickSort $i $fimVet
  fi

}

tamVetor=$1
gerarVetor $tamVetor
