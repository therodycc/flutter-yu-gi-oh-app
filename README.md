# 🃏 Yu-Gi-Oh Cards Flutter App

```Prompts de GPT se encuentran en el archivo gpt.md```

---
<img width="352" height="622" alt="image" src="https://github.com/user-attachments/assets/a8cd96d9-cc80-4f62-a017-62866c2ceb9b" />
<img width="352" height="624" alt="image" src="https://github.com/user-attachments/assets/37f18edf-92bf-40d8-bd67-f4bfa9eb35eb" />

---


## 🧠 Arquitectura

```
lib/
├── data/
│   ├── models/
│   └── services/
│
├── domain/
│   └── entities/
│
├── presentation/
│   ├── pages/
│   └── widgets/
```

---

## 📡 API utilizada

Se consume una API pública de cartas de Yu-Gi-Oh que proporciona:

```https://db.ygoprodeck.com/api/v7/cardinfo.php```

* Nombre de la carta (`name`)
* Tipo (`type`)
* URL de la imagen (`image_url`)

---

## 🔍 Sistema de búsqueda

El buscador implementa:

* Filtrado local por nombre
* Normalización a minúsculas
* Eliminación de espacios
* Debounce de 300 ms para evitar renders innecesarios

---

## 🎨 Diseño

La interfaz sigue un estilo moderno enfocado en apps de entretenimiento:

* Cards visuales con imagen completa
* Gradiente inferior para legibilidad
* Sombras suaves
* Estética dark/gaming
* Componentes reutilizables

---

## 🚀 Instalación y ejecución

### 1️⃣ Clonar el repositorio

```bash
git clone https://github.com/therodycc/flutter-yu-gi-oh-app.git
```

### 2️⃣ Ejecutar la app

```bash
flutter pub get; flutter run
```
