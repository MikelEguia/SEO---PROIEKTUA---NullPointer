#!/usr/bin/env bash

function proiektuaPaketatu() {
    tar cvzf /home/$USER/hitzorduak.tar.gz -C /home/$USER/hitzorduak aplikazioa.py script.sql .env requirements.txt templates
}

function mysqlKendu() {
    sudo systemctl stop mysql.service
    sudo apt purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*
    sudo apt autoremove -y
    sudo apt autoclean
    sudo rm -rf /var/lib/mysql /etc/mysql/ /var/log/mysql
}

function kokapenBerriaSortu() {
    if [ -d "/var/www/$1" ]; then
        sudo rm -rf "/var/www/$1"
    fi
    sudo mkdir -p "/var/www/$1"
    sudo chown -R $USER:$USER "/var/www/$1"
}

function menutikIrten() {
    echo "Instalatzailearen bukaera"
}

function proiektuaKokapenBerrianKopiatu() {
    echo "Kopiatzen eta deskonprimatzen..."
    if [ -f "/home/$USER/hitzorduak.tar.gz" ]; then
        sudo tar -xvzf "/home/$USER/hitzorduak.tar.gz" -C /var/www/hitzorduak 
        echo "Fitxategiak ondo kopiatu dira."
    else
        echo "Errorea: /home/$USER/hitzorduak.tar.gz ez da aurkitu." 
    fi
} 

function mysqlInstalatu() {
    dpkg -s mysql-server >/dev/null 2>&1 || sudo apt install -y mysql-server
    sudo systemctl start mysql
}

function datubaseaKonfiguratu() {
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

function ingurunebirtualaSortu() {
    echo "Sistema eguneratzen..."
    sudo apt update
    echo "Python tresnak eta garapen-paketeak instalatzen..."
    sudo apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools python3-venv
    echo "Ingurune birtuala (venv) sortzen /var/www/hitzorduak karpetan..."
    cd /var/www/hitzorduak
    python3 -m venv venv
    echo "Ingurune birtuala aktibatzen..."
    source venv/bin/activate
    echo "Ingurunea prest!"
}

function liburutegiakInstalatu() {
    echo "Python ingurunea aktibatzen eta liburutegiak instalatzen..."
    cd /var/www/hitzorduak
    source venv/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    echo "Liburutegiak ondo instalatu dira!"
}

function flaskekozerbirariarekindenaProbatu() {
    echo "Flask zerbitzaria abiarazten (garapen moduan)..."
    cd /var/www/hitzorduak
    source venv/bin/activate
    if [ -f "aplikazioa.py" ]; then
        python3 aplikazioa.py &
        FLASK_PID=$!
        echo "Nabigatzailea irekitzen..."
        firefox http://127.0.0.1:5000/ &
        echo "Sakatu ENTER hemen zerbitzaria gelditzeko."
        read
        kill $FLASK_PID
        deactivate
        echo "Flask zerbitzaria geldituta."
    else 
        echo "Errorea: aplikazioa.py ez da aurkitu /var/www/hitzorduak karpetan!"
    fi
}

function nginxInstalatu() {
    if dpkg -s nginx >/dev/null 2>&1; then
        echo "NGINX instalatuta dago."
    else
        sudo apt update
        sudo apt install -y nginx
    fi
}

function nginxMatxanJarri() {
    if systemctl is-active -q nginx; then
        echo "NGINX martxan dago."
    else
        sudo systemctl start nginx
    fi
}

function nginxatakaTesteatu() {
    if ! dpkg -s net-tools >/dev/null 2>&1; then
        sudo apt install -y net-tools
    fi
    sudo netstat -tulnp | grep nginx
}

function indexIkusi() {
    echo "Firefox irekitzen http://127.0.0.1 helbidean..."
        firefox http://127.0.0.1 &
    if [ $? -eq 0 ]; then
        echo "Nabigatzailea ondo ireki da."
    else
        echo "Errorea: Ezin izan da Firefox ireki. Ziurtatu instalatuta dagoela."
    fi
}

function indexPertsonalizatu() {
    echo "Nginx-en orri lehenetsia ordezkatzen..."
    sudo rm -f /var/www/html/index.nginx-debian.html

    sudo bash -c "cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang='eu'>
<head>
    <meta charset='UTF-8'>
    <title>SEO Taldea</title>
</head>
<body>
    <h1>Taldearen izena: SEO</h1>
    <h2>Azpitaldea: Asteartea</h2>

    <table border='1'>
        <thead>
            <tr>
                <th>Izena</th>
                <th>Abizenak</th>
                <th>Posta elektronikoa</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Jon</td>
                <td>Zalbide Dabouza</td>
                <td>jon.zalbide1@gmail.com</td>
            </tr>
            <tr>
                <td>Mikel</td>
                <td>Eguia Bengoa</td>
                <td>meguiabengoa@gmail.com</td>
            </tr>
            <tr>
                <td>Marco</td>
                <td>Alonso Fernandez</td>
                <td>marcoalonsofernandez@gmail.com</td>
            </tr>
            <tr>
                <td>Etxahun</td>
                <td>Amutio Fernandez</td>
                <td>amutioo06@gmail.com</td>
            </tr>
        </tbody>
    </table>

    <p><strong>Taldeburua:</strong> Marco Alonso Fernandez </p>
    <p><strong>Posta elektronikoa:</strong> marcoalonsofernandez@gmail.com</p>

</body>
</html>
EOF"

    sudo systemctl restart nginx

    echo "Firefox irekitzen: http://localhost/index.html"
    firefox http://localhost/index.html &
}

menuopt=0
while test $menuopt -ne 26
do
    echo "[ 0] Proiektu-fitxategiak paketatu eta konprimatu"
    echo "[ 1] mySQL kendu"
    echo "[ 2] Kokapen berria sortu"
    echo "[ 3] Kokapen berrian kopiatu"
    echo "[ 4] MySQL instalatu"
    echo "[ 5] Datu Basea konfiguratu"
    echo "[ 6] Datu Basea sortu"
    echo "[ 7] Ingurune Birtuala sortu"
    echo "[ 8] Liburutegiak instalatu"
    echo "[ 9] Flask zerbitzaria probatu"
    echo "[10] Nginx instalatu"
    echo "[11] Nginx martxan jarri" 
    echo "[12] Nginx ataka testeatu"
    echo "[26] Menutik irten"
    read -p "Zein aukera egin nahi duzu? " menuopt
    
    case $menuopt in
        0) proiektuaPaketatu;;
        1) mysqlKendu;;
        2) kokapenBerriaSortu hitzorduak;;
        3) proiektuaKokapenBerrianKopiatu;;
        4) mysqlInstalatu;;
        5) datubaseaKonfiguratu;;
        6) datubaseaSortu;;
        7) ingurunebirtualaSortu;;
        8) liburutegiakInstalatu;;
        9) flaskekozerbirariarekindenaProbatu;;
        10) nginxInstalatu;;
        11) nginxMatxanJarri;;
        12) nginxatakaTesteatu;;
        26) menutikIrten;;
        *) ;;
    esac
done

exit 0
