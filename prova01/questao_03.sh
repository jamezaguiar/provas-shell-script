#!/bin/bash
aluno=$1
nota1=`grep $aluno /home/compartilhado/notas/primeira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota2=`grep $aluno /home/compartilhado/notas/segunda_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
nota3=`grep $aluno /home/compartilhado/notas/terceira_prova.txt | cut -f2 -d'|' | cut -f2 -d' '`
soma=`expr $nota1 + $nota2 + $nota3 2> /dev/null`
media=`expr $soma / 3 2> /dev/null`
echo $media
