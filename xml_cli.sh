#!/bin/bash

echo "Bem-vindo à Minha CLI"
echo -n "Insira o caminho do arquivo de texto: "
read -r caminho_arquivo

arquivo=$(readlink -f "$caminho_arquivo")

mkdir -p "./resultados"

while read -r linha; do
  grep -l -R "$linha"  --include="*.xml" | xargs -I {} mv {} resultados/
done < "$arquivo"



echo "Total de xml's movidos para a pasta resultados:"
ls -1 "./resultados" | wc -l
