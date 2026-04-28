#!/usr/bin/env bash

function proiektuaPaketatu() {
    tar cvzf /home/mikel/hitzorduak.tar.gz -C /home/mikel/Documentos/SEO/Hitzorduak \
    aplikazioa.py \
    script.sql \
    .env \
    requirements.txt \
    templates
}

function mysqlKendu() {
    sudo systemctl stop mysql.service
    sudo apt purge -y \
    mysql-server \
    mysql-client \
    mysql-common \
    mysql-server-core-* \
    mysql-client-core-*
    
    sudo apt autoremove -y
    sudo apt autoclean
    sudo rm -rf /var/lib/mysql /etc/mysql/ /var/log/mysql
}

function kokapenBerriaSortu() {
    # Cambiadas comillas curvas ” por rectas "
    if [ -d "/var/www/$1" ]
    then
        sudo rm -rf "/var/www/$1"
    fi
    sudo mkdir -p "/var/www/$1"
    sudo chown -R mikel:mikel "/var/www/$1"
}

function menutikIrten() {
    echo "Instalatzailearen bukaera"
}

function proiektuaKokapenBerrianKopiatu() {
    echo "Kopiatzen eta deskonprimatzen..."
    if [ -f "/home/mikel/hitzorduak.tar.gz" ]; then
        
        sudo tar -xvzf "/home/mikel/hitzorduak.tar.gz" -C /var/www/hitzorduak 
        echo "Fitxategiak ondo kopiatu dira."
    else
        echo "Errorea: /home/mikel/hitzorduak.tar.gz ez da aurkitu." 
    fi
} 

function mysqlInstalatu() {
	
        dpkg -s mysql-server >/dev/null 2>&1 || sudo apt install -y mysql-server
	sudo systemctl start mysql
}

function datubaseaKonfiguratu() {
    echo "Datu-basea eta erabiltzailea konfiguratzen..."
    echo "Datu-basea eta erabiltzailea konfiguratzen..."
    sudo mysql <<EOF   
DROP USER IF EXISTS 'lsi'@'localhost';
CREATE USER 'lsi'@'localhost' IDENTIFIED BY 'lsi';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD ON *.* TO 'lsi'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

    if [ $? -eq 0 ]; then
        echo "Erabiltzailea 'lsi' garbitu eta ondo sortu da."
    else
        echo "Errorea erabiltzailea konfiguratzean."
    fi
}

function datubaseaSortu() {
echo "Datu-basea eta taulak sortzen..."
    
mysql -u lsi -plsi -e "CREATE DATABASE IF NOT EXISTS invitados;"
    
mysql -u lsi -plsi invitados < /var/www/hitzorduak/script.sql

if [ $? -eq 0 ]; then
	echo "Datu-basea eta taulak ondo sortu dira."
else
        echo "Errorea script.sql exekutatzean."
fi
}

menuopt=0
while test $menuopt -ne 26
do
    echo -e "[ 0] Proiektu-fitxategiak paketatu eta konprimatu"
    echo -e "[ 1] mySQL kendu \n"
    echo -e "[ 2] Kokapen berria sortu \n"
    echo -e "[ 3] Kokapen berrian kopiatu \n"
    echo -e "[ 4] MySQL instalatu \n"
    echo -e "[ 5] Datu Basea konfiguratu \n"
    echo -e "[ 6] Datu Basea sortu \n"
    echo -e "[26] Menutik irten \n"
    
    read -p "Zein aukera egin nahi duzu? " menuopt
    
    case $menuopt in
        0) proiektuaPaketatu;;
        1) mysqlKendu;;
        2) kokapenBerriaSortu hitzorduak;;
        3) proiektuaKokapenBerrianKopiatu;;
	4) mysqlInstalatu;;
	5) datubaseaKonfiguratu;;
	6) datubaseaSortu;;
        26) menutikIrten;;
        *) ;;
    esac
done

exit 0
