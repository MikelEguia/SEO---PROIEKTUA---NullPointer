# SEO - PROIEKTUA - NullPointer

## 📋 Proiektuaren Deskribapena

SEO - PROIEKTUA - NullPointer NullPointer taldearen zenbat ere lankidegoa den proiektu bat da. Biltegi honek proiektuaren garapenerako beharrezkoak diren baliabide, kodea eta dokumentazioa guztia ditu.

---

## 🚀 Hastea

### Aurreko Eskakizunak

Hastea aurretik, zure Ubuntu 24.04 sisteman honakoa instalatuta egotea ziurtatu behar duzu:

- **Git**: Bertsio kontrol
- **Python** (proiektuarentzat beharrezkoa bada)
- **Terminal/Bash**: Komandoak exekutatzeko

### Git Instalazioa Egiaztatu

```bash
git --version
```

Git instalatuta ez baduzu, exekutatu:

```bash
sudo apt update
sudo apt install git
```

### Git Konfiguratu (Lehenengo Aldiz)

```bash
git config --global user.name "Zure Izena"
git config --global user.email "zure.email@example.com"
```

---

## 📥 Biltegia Deskargatu (Clone)

### 1. Aukera: Biltegia Klonatu (Gomendatuta integrante berrientzat)

Ireki zure terminala eta exekutatu:

```bash
git clone https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer.git
```

Gero sartu proiektuaren direktorioan:

```bash
cd SEO---PROIEKTUA---NullPointer
```

Komando honek biltegiaren kodea eta osoa historia deskargatu ditu.

### 2. Aukera: Fork + Clone (Kanpoko ekartzaileen)

1. Egin **Fork** biltegia GitHub-ean (goiko eskuinean dagoen botoia)
2. Klonatu zure fork:

```bash
git clone https://github.com/ZURE_ERABILTZAILEA/SEO---PROIEKTUA---NullPointer.git
cd SEO---PROIEKTUA---NullPointer
```

---

## 📤 Lanaren Fluxua: Push eta Pull

### 1. Ikusi Egungo Egoera

Edozein ekintza aurretik, egiaztatu zer fitxategi aldatu dituzun:

```bash
git status
```

### 2. Deskargatu Taldearen Aldaketak (Pull)

Biltegiaren etxerako aldaketa azkenen lortzeko:

```bash
git pull origin main
```

Komando honek:
- Aldaketa azkenen deskargatu
- Automatikoki zure lokalen ramara fusionatu

**💡 Gomendioa**: Beti exekutatu `git pull` lanean hasi aurretik.

### 3. Gehitu Lokalen Aldaketak (Add)

Fitxategiak aldatu ondoren, gehitu staging eremura:

```bash
# Gehitu fitxategi espezifiko bat
git add fitxategiaren_izena.txt

# Gehitu aldaketa guztiak
git add .
```

### 4. Gorde Lokalen Aldaketak (Commit)

Sortu commit deskribatze mezua batekin:

```bash
git commit -m "Egindako aldaketa argi eta garbi deskribatu"
```

**Oneko mezuen adibideak:**
```bash
git commit -m "Gehitu autentifikazio funtzioa"
git commit -m "Zuzendu SEO kalkuluan errore"
git commit -m "Eguneratu README dokumentazioa"
```

### 5. Igo Aldaketak Biltergiaren (Push)

Igo aldaketak erremoten zerbitzarira:

```bash
git push origin main
```

---

## 🔄 Lanaren Fluxu Osoa: Urratsez Urratsa

### 1. Kasua: Hasierako deskarga eta lehenengo aldaketa

```bash
# 1. Klonatu biltegia
git clone https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer.git
cd SEO---PROIEKTUA---NullPointer

# 2. Deskargatu aldaketa azkenen
git pull origin main

# 3. Aldaketak egiten dituzun fitxategiak
# (Aldatu behar dituzun fitxategiak)

# 4. Ikusi zer aldatuz
git status

# 5. Gehitu aldaketak
git add .

# 6. Egin commit
git commit -m "Nire aldaketen deskribapena"

# 7. Igo aldaketak
git push origin main
```

### 2. Kasua: Erregularki eguneratzea

```bash
# Beti taldearen aldaketen deskargetan hasi
git pull origin main

# Aldaketak egiten dituzun...
git status

# Gehitu aldaketak
git add .

# Commit
git commit -m "Deskribapena"

# Push
git push origin main
```

---

## 🌿 Rametan Lana (Aukeran baina Gomendatuta)

Gatazka saihesteko, integrante bakoitzak bere ramaban lana egin ditzake:

### Sortu rama berria

```bash
git branch nire-rama
git checkout nire-rama
```

Edo linean:

```bash
git checkout -b nire-rama
```

### Ikusi rama guztia

```bash
git branch -a
```

### Aldatu ramaz

```bash
git checkout main
git checkout nire-rama
```

### Fusionatu rama main-arekin (commit egin ondoren)

```bash
# Lehenengo eguneratu main
git checkout main
git pull origin main

# Gero fusionatu zure rama
git merge nire-rama

# Igo aldaketak
git push origin main
```

---

## ⚠️ Gatazka eta Arazoen Irtenbidea

### Merge gatazka badago

1. Ireki gatazka duen fitxategia
2. Resolitu gatazkak eskuz
3. Gorde fitxategia
4. Exekutatu:

```bash
git add .
git commit -m "Resolitu gatazka"
git push origin main
```

### Baztertu lokalen aldaketak

```bash
# Baztertu aldaketak fitxategi espezifikoan
git checkout -- fitxategiaren_izena.txt

# Baztertu aldaketa guztia
git reset --hard
```

### Ikusi aldaketen historia

```bash
git log --oneline
```

---

## 📝 Oneko Praktiken Gidalerro

✅ **EGITEN:**
- Egin `git pull` lanean hasi aurretik
- Egin commit argi eta garbi mezuekin
- Egin push behin batean eguna
- Komunikatu taldearekin aldaketa garrantzitsuekin

❌ **EGIN GAB:**
- Push egin commit gabe
- Erabili commit mezuak generikoak "aldaketa" bezala
- Aldatu beste baten fitxategiak abisurik gabe
- Egin komitiak beharrezkoa ez bada push ondoren

---

## 👥 Taldea

**Proiektua**: SEO - PROIEKTUA - NullPointer  
**Taldea**: NullPointer  
**Biltegia**: https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer

---

**Azken eguneratzea**: 2026-04-23