#!/usr/bin/env bash

#Acesso ROOT.

[ $UID -ne '0' ] && { echo "Necessário ter Acesso ROOT."; exit 1 ;}

export LANG=C.UTF-8

Cyan="\033[0;36m"
Purple="\033[0;35m"
white='\e[1;37m'
BlueF='\e[1;34m'
yellow="\033[1;33m"

echo -e "$Purple"

        cat <<banner

                    ▄▀▀█▄▄   ▄▀▀█▄   ▄▀▀▀▀▄
                   ▐ ▄▀   █ ▐ ▄▀ ▀▄ █
                     █▄▄▄▀    █▄▄▄█ █    ▀▄▄
                     █   █   ▄▀   █ █     █ █
                    ▄▀▄▄▄▀  █   ▄▀  ▐▀▄▄▄▄▀ ▐
                      █    ▐   ▐   ▐   ▐
                      ▐
                      By Anderson.b.Silva

banner

menu()
{
   echo -e "\t\t\t $Cyan B.A.G v1.1\n"
   echo -e "\t\t $Cyan Atenção! Não utilize Imagens $yellow(.PNG)\n"
   echo -e "\t$Purple[1] $Cyan[$white Esconder Um Texto dentro de uma Imagem       $Cyan] $white: "
   echo -e "\t$Purple[2] $Cyan[$white Extrair o Texto de uma Imagem                $Cyan] $white: "
   echo -e "\t$Purple[3] $Cyan[$white Algoritmos de criptografia e modos suportados$Cyan] $white: "
   echo -e "\t$Purple[4] $Cyan[$white Check as Informações da Imagem               $Cyan] $white: "
   echo -e "\t$Purple[5] $Cyan[$white Check se o steghide está instalado           $Cyan] $white: "
   echo -e "\t$Purple[6] $Cyan[$white Instalar o steghide                          $Cyan] $white: "
   echo -e "\t$Purple[7] $Cyan[$white Sair                                         $Cyan] $white: "
   echo -e "\t$Purple Escolha uma Opção [1/2/3/4/5/6/7]?"
   echo -e "$white"
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   read menu

case $menu in
  1) Esconder;;
  2) Extrair;;
  3) algoritmos;;
  4) Informa;;
  5) Dependências;;
  6) Instale;;
  7) sair;;
  *) echo -e $yellow'opicão invalida, tente novamente!'&&sleep 2&&menu;;
esac
}
echo -e "$white"
function Esconder () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   echo -e "$Cyan\t Digite o nome da Imagem:$white\n"
   read Esconder
   echo -e "$Cyan\t Digite o nome do Texto: $white\n"
   read Texto
   echo `steghide embed -cf $Esconder -ef $Texto `
   clear
   echo -e "$yellow[!] $BlueF Pronto! Agora é só excluir o Texto Original!"
   echo -e "$yellow[!] $BlueF O Seu Texto já Está dentro da Imagem:$yellow $Esconder"
   echo -e "$yellow[!] $BlueF Para Extrair o Texto da Imagem Ultilize a Opção $yellow [2]"
}

function Extrair () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   echo -e "$Cyan\t Digite o nome da Imagem:$white\n"
   read Extrair
   echo -e `steghide extract -sf $Extrair`
   clear
   echo -e "$yellow[!] $BlueF Texto Extraido Com Sucesso!"
}

function algoritmos () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   echo -e  `steghide encinfo`
}

function Informa () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   echo -e "$Cyan\t Digite o nome da Imagem:$white\n"
   read Informa
   echo -e `steghide info $Informa`
}

function Dependências () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   clear
   echo -e "$yellow[!] $Cyan Dependências .... $white"
   echo `dpkg -l | grep steghide `
}

function Instale () {
   echo -n -e $Cyan'  \t BAG@CODE:\033[0m >> '; tput sgr0
   clear
   echo -e "$yellow[!] $Cyan Instalando o steghide .... $white"
   echo `apt-get install steghide -y`
 }

function sair()
{
   echo -e "$Purple\tPressione [Enter] para Sair .............."&&read&&exit 0
}
menu
