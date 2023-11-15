#!/bin/bash

echo "Bem-vindo à Minha CLI"
echo -n "Insira o caminho do arquivo de texto: "
read -r caminho_arquivo

arquivo=$(readlink -f "$caminho_arquivo")

mkdir -p "./resultados"

dados=$(while read -r linha; do
  grep -l "$linha" *.xml | xargs -I {} cp {} resultados/
done < "$arquivo"
)


echo "Os xml's foram copiados para a pasta resultados"
