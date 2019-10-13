#!/bin/bash
bubbleSort() {
  s1=$(expr $1 - 1)
  s2=$(expr $1 - 2)
  shift 1
  vetorOrdenado=($@)
  echo "Ordenando com BubbleSort..."
  for i in $(seq 0 $s1); do
    for j in $(seq 0 $s2); do
      jaux=$(expr $j + 1)
      if [ "${vetorOrdenado[$j]}" -gt "${vetorOrdenado[$jaux]}" ]; then
        temp=${vetorOrdenado[$j]}
        vetorOrdenado[$j]=${vetorOrdenado[$jaux]}
        vetorOrdenado[$jaux]=$temp
      fi
    done
  done

  echo "Vetor ordenado: ${vetorOrdenado[@]}"
}

tamVetor=$1
declare -a vetorGerado
for x in $(seq $tamVetor); do
  vetorGerado[x]=$RANDOM
done
echo "Vetor aleatório: ${vetorGerado[@]}"
bubbleSort $tamVetor ${vetorGerado[@]}
