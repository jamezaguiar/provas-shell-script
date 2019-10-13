#!/bin/bash
getopts "o:i:" OPTVAR

gerarHtml() {
  printf "<html>
\t<head>
\t\t<title>
\t\t\tMeus Links Favoritos
\t\t</title>
\t</head>
\t<body>
\t\t<p>Apresento aqui meus sites favoritos:</p>\n" >>$1

  for i in $(cat $2); do
    link=$(echo $i | cut -f2 -d':')
    titulo=$(echo $i | cut -f1 -d':')
    printf "\t\t<a href=\"http://"$link\"">$titulo</a>\n\t\t<br />\n" >>$1
  done

  printf "\t</body>\n</html>\n" >>$1
}

case "$OPTVAR" in
"o")
  html=$OPTARG
  getopts "o:i:" OPTVAR
  if [ "$OPTVAR" == "i" ]; then
    texto=$OPTARG
    gerarHtml $html $texto
  else
    echo "USO CORRETO: -o <nome da página HTML a ser gerada> -i <nome do arquivo de texto que contém títulos e links das páginas>"
    exit 1
  fi
  ;;
"i")
  texto=$OPTARG
  getopts "o:i:" OPTVAR
  if [ "$OPTVAR" == "o" ]; then
    html=$OPTARG
    gerarHtml $html $texto
  else
    echo "USO CORRETO: -i <nome do arquivo de texto que contém títulos e links das páginas> -o <nome da página HTML a ser gerada>"
    exit 1
  fi
  ;;
*)
  echo "USO CORRETO: -i <nome do arquivo de texto que contém títulos e links das páginas> -o <nome da página HTML a ser gerada>"
  ;;

esac
