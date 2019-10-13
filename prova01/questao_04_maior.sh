#!/bin/bash
aluno=$1
nota1=`grep $aluno /home/compartilhado/notas/primeira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota2=`grep $aluno /home/compartilhado/notas/segunda_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota3=`grep $aluno /home/compartilhado/notas/terceira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
echo $nota1 >> auxiliarMaior.txt
echo $nota2 >> auxiliarMaior.txt
echo $nota3 >> auxiliarMaior.txt
maior=`cat auxiliarMaior.txt | sort -n | tail -n1`
rm auxiliarMaior.txt
echo $maior
