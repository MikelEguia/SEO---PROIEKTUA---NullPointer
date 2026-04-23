# SEO - PROIEKTUA - NullPointer

## 📋 Descripción del Proyecto

SEO - PROIEKTUA - NullPointer es un proyecto colaborativo desarrollado por el equipo NullPointer. Este repositorio contiene todos los recursos, código y documentación necesarios para el desarrollo del proyecto.

---

## 🚀 Comenzar

### RequisitosPrevios

Antes de comenzar, asegúrate de tener instalado lo siguiente en tu sistema Ubuntu 24.04:

- **Git**: Control de versiones
- **Python** (si es necesario para el proyecto)
- **Terminal/Bash**: Para ejecutar los comandos

### Verificar Instalación de Git

```bash
git --version
```

Si no tienes Git instalado, ejecuta:

```bash
sudo apt update
sudo apt install git
```

### Configurar Git (Primera Vez)

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@example.com"
```

---

## 📥 Descargar el Repositorio (Clone)

### Opción 1: Clonar el Repositorio (Recomendado para nuevos integrantes)

Abre tu terminal y ejecuta:

```bash
git clone https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer.git
```

Luego entra al directorio del proyecto:

```bash
cd SEO---PROIEKTUA---NullPointer
```

Este comando descargará todo el código del repositorio y el historial completo.

### Opción 2: Fork + Clone (Para contribuidores externos)

1. Haz un **Fork** del repositorio en GitHub (botón en la esquina superior derecha)
2. Clona tu fork:

```bash
git clone https://github.com/TU_USUARIO/SEO---PROIEKTUA---NullPointer.git
cd SEO---PROIEKTUA---NullPointer
```

---

## 📤 Flujo de Trabajo: Push y Pull

### 1. Ver el Estado Actual

Antes de cualquier acción, verifica qué archivos has modificado:

```bash
git status
```

### 2. Descargar Cambios del Equipo (Pull)

Para obtener los últimos cambios del repositorio remoto:

```bash
git pull origin main
```

Este comando:
- Descarga los cambios más recientes
- Fusiona automáticamente en tu rama local

**💡 Recomendación**: Siempre ejecuta `git pull` antes de comenzar a trabajar.

### 3. Agregar Cambios Locales (Add)

Después de modificar archivos, agrégalos al área de staging:

```bash
# Agregar un archivo específico
git add nombre_del_archivo.txt

# Agregar todos los cambios
git add .
```

### 4. Guardar Cambios Locales (Commit)

Crea un commit con un mensaje descriptivo:

```bash
git commit -m "Descripción clara del cambio realizado"
```

**Ejemplos de buenos mensajes:**
```bash
git commit -m "Agregar función de autenticación"
git commit -m "Corregir error en el cálculo de SEO"
git commit -m "Actualizar documentación del README"
```

### 5. Subir Cambios al Repositorio (Push)

Sube tus cambios al servidor remoto:

```bash
git push origin main
```

---

## 🔄 Flujo Completo: Paso a Paso

### Caso 1: Descarga inicial y primer cambio

```bash
# 1. Clonar el repositorio
git clone https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer.git
cd SEO---PROIEKTUA---NullPointer

# 2. Descargar cambios más recientes
git pull origin main

# 3. Realizar cambios en tus archivos
# (Edita los archivos que necesites)

# 4. Ver qué cambiaste
git status

# 5. Agregar cambios
git add .

# 6. Hacer commit
git commit -m "Descripción de mis cambios"

# 7. Subir cambios
git push origin main
```

### Caso 2: Actualización regular

```bash
# Siempre comenzar descargando cambios del equipo
git pull origin main

# Realizar cambios...
git status

# Agregar cambios
git add .

# Commit
git commit -m "Descripción"

# Push
git push origin main
```

---

## 🌿 Trabajo con Ramas (Opcional pero Recomendado)

Para evitar conflictos, cada integrante puede trabajar en su propia rama:

### Crear una nueva rama

```bash
git branch mi-rama
git checkout mi-rama
```

O en una línea:

```bash
git checkout -b mi-rama
```

### Ver todas las ramas

```bash
git branch -a
```

### Cambiar de rama

```bash
git checkout main
git checkout mi-rama
```

### Fusionar rama con main (después de hacer commit)

```bash
# Primero actualiza main
git checkout main
git pull origin main

# Luego fusiona tu rama
git merge mi-rama

# Sube los cambios
git push origin main
```

---

## ⚠️ Conflictos y Solución de Problemas

### Si hay conflicto de merge

1. Abre el archivo con conflicto
2. Resuelve manualmente los conflictos
3. Guarda el archivo
4. Ejecuta:

```bash
git add .
git commit -m "Resolver conflicto"
git push origin main
```

### Descartar cambios locales

```bash
# Descartar cambios en un archivo específico
git checkout -- nombre_archivo.txt

# Descartar todos los cambios
git reset --hard
```

### Ver historial de cambios

```bash
git log --oneline
```

---

## 📝 Guías de Buenas Prácticas

✅ **HACER:**
- Hacer `git pull` antes de comenzar a trabajar
- Hacer commits con mensajes claros y descriptivos
- Hacer push al menos una vez al día
- Comunicar con el equipo antes de cambios importantes

❌ **NO HACER:**
- Hacer push sin hacer commit primero
- Usar mensajes de commit genéricos como "cambios"
- Modificar archivos de otros sin avisar
- Hacer commits innecesarios después de hacer push

---

## 👥 Equipo

**Proyecto**: SEO - PROIEKTUA - NullPointer  
**Equipo**: NullPointer  
**Repositorio**: https://github.com/MikelEguia/SEO---PROIEKTUA---NullPointer

---

## 📞 Contacto y Soporte

Para preguntas o problemas con Git, contacta con los administradores del proyecto o consulta la [documentación oficial de Git](https://git-scm.com/doc).

---

## 📄 Licencia

Este proyecto está bajo licencia [especificar licencia si aplica].

---

**Última actualización**: 2026-04-23 10:32:21