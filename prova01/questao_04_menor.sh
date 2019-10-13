#!/bin/bash
aluno=$1
nota1=`grep $aluno /home/compartilhado/notas/primeira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota2=`grep $aluno /home/compartilhado/notas/segunda_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota3=`grep $aluno /home/compartilhado/notas/terceira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
echo $nota1 >> auxiliarMenor.txt
echo $nota2 >> auxiliarMenor.txt
echo $nota3 >> auxiliarMenor.txt
menor=`cat auxiliarMenor.txt | sort -n | head -n1`
rm auxiliarMenor.txt
echo $menor
