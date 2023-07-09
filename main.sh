#!/bin/bash

# Digite a pasta na qual se localiza o arquivo txt
diretorio=$(pwd)

echo "Seu nome de usuário é:"
whoami
echo "Informações sobre a hora atual e o tempo que o computador está ligado:"
uptime
echo "O script está executando no diretório:"
echo "$diretorio"

apt_instalar() {
    sudo apt update
    sudo apt upgrade
    while read -r line; 
    do
        echo "Executando..."
        yes | sudo apt install "$line"
        sudo apt-get install wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg
        sudo apt install apt-transport-https
        sudo apt update
        sudo apt install code
    done < "$apt_programs"
    iniciar
}

iniciar() {
    echo "Selecione uma opção"
    echo
    echo "1 - Instalar programas APT"
    echo "2 - Sair"
    echo
    while true;
    do
        read -r opcao_selecionada
        case $opcao_selecionada in
            1) apt_programs="$diretorio/programs.txt"
               apt_instalar;;
            2) echo "Saindo..."
                exit ;;
            *) echo "Opção inválida. Por favor, selecione novamente.";;
        esac
    done
}

iniciar

