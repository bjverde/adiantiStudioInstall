#!/bin/bash
#Download e instalação do PHP-GTK e do Adianti Studio Pro 7.0.0 no Ubuntu 18.04.3
#https://adianti.com.br/studio-linux
#https://www.adianti.com.br/download-center?app=studio-lin
#https://sourceforge.net/projects/adianti/files/
#Luciano Ribeiro <lucianorstech@gmail.com>


#Cores
RED='\033[0;31m'
LGREEN='\033[0;32m'
YBLUE='\033[1;33;4;44m'
NC='\033[0m' # No Color

logoAdianti="
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                      
 █████╗ ██████╗ ██╗ █████╗ ███╗   ██╗████████╗██╗     
██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║╚══██╔══╝██║     
███████║██║  ██║██║███████║██╔██╗ ██║   ██║   ██║     
██╔══██║██║  ██║██║██╔══██║██║╚██╗██║   ██║   ██║     
██║  ██║██████╔╝██║██║  ██║██║ ╚████║   ██║   ██║     
╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝     
                                                      
███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗         
██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗        
███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║        
╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║        
███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝        
╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝         
                                                      
"

echo -e "${LGREEN} ${logoAdianti} ${NC}"
echo -e "${LGREEN} Criado por Luciano Ribeiro <lucianorstech@gmail.com> ${NC}"
echo -e "${LGREEN} Modificado por Reinaldo Barreto <bjverde@yahoo.com.br> ${NC}"
echo -e "\n"

if ! command -v lsb_release &> /dev/null
then
    echo -e "${RED} Sua distro não é compativel com Ubuntu ou Debian, o instalador pode não funcionar ${NC}"
else
    echo -e "${YBLUE} $(lsb_release -d) ${NC}"
fi


echo -e "\n${YBLUE} Etapa 1/7 - Download e instalação do PHP-GTK e do Adianti Studio Pro 7.0.0 ${NC}"
sleep 2
wget -O php-gtk2-64bits.tar.gz -c http://downloads.sourceforge.net/adianti/php-gtk2f-bin-64bits.tar.gz


echo -e "\n${YBLUE} Etapa 2/7 - Descompactando, instalando e criando atalho do PHP-GTK ${NC}"
sleep 2
sudo tar -xzvf php-gtk2-64bits.tar.gz
sudo chmod 777 php-gtk2 -Rf
sudo mv php-gtk2/ /usr/local/
sudo cp -R /usr/local/php-gtk2/share/gtksourceview-1.0/ /usr/share/
sudo ln -sf /usr/local/php-gtk2/bin/php /usr/bin/php-gtk2

echo -e "\n${YBLUE} Etapa 3/7 - Removendo o arquivo baixado: php-gtk2-64bits.tar.gz${NC}"
sleep 2
sudo rm -Rf php-gtk2-64bits.tar.gz

echo -e "\n${YBLUE} Etapa 4/7 - O download do instalador do Adianti Studio Pro 7.0.0${NC}"
sleep 2
wget -O  adianti-studio-7.0.tgz -c https://downloads.sourceforge.net/adianti/studio-7.0.0.tgz

echo -e "\n${YBLUE} Etapa 5/7 - Descompactando e instalando o Adianti Studio Pro 7.0.0${NC}"
sudo tar -xzvf adianti-studio-7.0.tgz
sudo chmod 777 studio -Rf
sudo mv studio*/ studio7/
sudo mv studio7 /opt
sudo ln -s /opt/studio7/main.sh /usr/bin/main

echo -e "\n${YBLUE} Etapa 6/7 - Removendo o arquivo baixado: adianti-studio-7.0.tgz${NC}"
sudo rm -Rf adianti-studio-7.0.tgz
sleep 2

echo -e "\n${YBLUE} Etapa 7/7 - Criando atalho do Adianti Studio Pro 7.0.0${NC}"
sleep 2

sudo tee /usr/share/applications/studio7.desktop <<ATALHO
[Desktop Entry]
Version=1.0
Type=Application
Name=Adianti Studio Pro 7
GenericName=Adianti Studio
Comment=Adianti Studio Pro 7
Keywords=Adianti;Desenvolvimento;PHP;IDE;
Exec="/opt/studio7/main.sh" %f
Icon=/opt/studio7/favicon.png
Terminal=false
Categories=Desenvolvimento;PHP;IDE;
StartupNotify=true
StartupWMClass=adianti-studio-pro
ATALHO

echo -e "\n${YBLUE} Atalho do Adianti Studio Pro 7.0.0 Criado com sucesso!${NC}"
sleep 2

echo -e "\n${YBLUE} O Adianti Studio Pro 7.0.0 está pronto para ser usado${NC}"
sleep 2


# Para desinstalar o PHPGTK e o Adianti Studio Pro 7.0.0 use: 
# sudo rm /usr/bin/main
# sudo rm -r /opt/studio7
# sudo rm -r /usr/local/php-gtk2
# sudo rm -r /usr/bin/php-gtk2
# sudo rm -r /usr/local/php-gtk2/share/gtksourceview-1.0/
# sudo rm -r /usr/share/gtksourceview-1.0/
# sudo rm -r /usr/share/applications/studio7.desktop


# Permissão para salvar arquivos na pasta /var/www ou /var/www/html no linux ubuntu
# sudo chmod -R 777 /var/www
