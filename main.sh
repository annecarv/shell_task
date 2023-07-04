#!/bin/bash

#Digite a pasta na qual se localiza o arquivo txt
diretorio=C:\Users\anne_\OneDrive\Área de Trabalho\init/programs.txt

apt_instalar() {
    while read line; do
        sudo apt install $line
    done < "$apt_programs"
    iniciar
}

iniciar() {
    echo
    echo"Selecione uma opção"
    echo
    echo "1 - Instalar programas APT"
    echo "2 - Sair"
    echo
while:
    do
        read opcao_selecionada
        case $opcao_selecionada in

            1) apt_programs="$diretorio/programs.txt"
                apt_instalar;;

            2) exit
            esac
}

iniciar