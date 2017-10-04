#!/bin/bash

# Primer parámetro: el texto
# Segundo parámetro: veces

texto=$1
i=0
max=$2
while [ $i -lt $max ]
do
figlet $texto | lolcat
i=$[$i+1]
done
