# Flutter Clean Architecture Template

A highly opinionated, enterprise-grade Flutter starter template built on **Feature-First Clean Architecture** and powered by **GetX**.

| | |
|---|---|
| **Version** | `1.0.0+1` |
| **Dart SDK** | `>=3.10.7` |
| **State, DI, Routing** | GetX |
| **HTTP Client** | Dio (`NetworkCaller`) |
| **Local Storage** | SharedPreferences (`StorageService`) |
| **Sizing** | Responsive `Sizer` extensions |

---

## ⚡ Quick Start

```bash
flutter pub get
flutter run
```
* **Entry point:** `lib/main.dart`
* **App shell:** `lib/app.dart`
* **Routes table:** `lib/routes/app_routes.dart`

---

## 🏗️ Core Architecture & Rules

This project strictly adheres to **Clean Architecture** to ensure testability, separation of concerns, and massive scalability. 

**The 5 Golden Rules:**
1. **Feature-First:** Every feature lives in its own isolated folder under `lib/features/`. Cross-feature imports are prohibited. 
2. **Strict Layers:** Every feature must contain `domain/`, `data/`, and `presentation/` directories.
3. **Dependency Flow:** Controllers (`presentation`) call UseCases (`domain`). Data Repositories (`data`) implement Interfaces (`domain`). 
4. **Lazy Loading:** Controllers and Dependencies must be injected dynamically via Route `Bindings`, not globally.
5. **No Hardcoding:** All design tokens (Colors, Text Styles, Sizing, Assets) must come from `lib/core/utils/constants/`.

---

## 📂 Project Structure Explained

The project is strictly divided into two primary zones: **Core** (global utilities) and **Features** (independent business modules).

```text
lib/
├── main.dart                  # Application entry point & boot sequence
├── app.dart                   # Global GetMaterialApp Shell & Theme setup
│
├── core/                      # 🌍 GLOBAL ZONE: Shared across the entire app
│   ├── bindings/              # App-level dependency injection (e.g., Theme, Network)
│   ├── common/                # Shared UI widgets (buttons, text fields, cards)
│   ├── models/                # Shared generic models (e.g., API ResponseData)
│   ├── services/              # Global gateways: API Caller, SharedPreferences
│   └── utils/                 # Constants (Colors/Tokens), Logging, Formatters
│
├── features/                  # 🚀 FEATURE ZONE: Isolated business modules
│   ├── authentication/        # Example feature fully following Clean Architecture
│   │   ├── data/              # ↳ API calls, JSON parsing, Repository Implementations
│   │   ├── domain/            # ↳ Pure business rules, Entities, Repository Interfaces
│   │   ├── presentation/      # ↳ UI Screens, Widgets, and GetX Controllers
│   │   └── bindings/          # ↳ Feature-specific Dependency Injection
│   │
│   ├── bottom_nav/            # Main Navigation Shell Feature
│   └── splash/                # Splash Screen & Initialization Feature
│
└── routes/
    └── app_routes.dart        # 🗺️ Single source of truth for app navigation
```

## 🚀 How to Add a New Feature

Adding a new feature involves following the strict layer structure. Run this command to generate the skeleton:

```bash
mkdir -p lib/features/<name>/{data/{datasources,models,repositories},domain/{entities,repositories,usecases},presentation/{controllers,screens,widgets},bindings}
```

1. **Domain:** Define your models in `entities/`, write your interface in `repositories/`, and create the business logic in `usecases/`.
2. **Data:** Hit the API in `datasources/` using `NetworkCaller`, parse the JSON in `models/`, and implement the domain interface in `repositories/`.
3. **Presentation:** Update state via GetX in `controllers/` by executing the `usecase`. Observe the state in your `screens/`.
4. **Wiring:** Inject everything in `bindings/` and register the route in `app_routes.dart`.

---

## 📚 Further Reading

For an in-depth breakdown of the layers, data flow, and specific code recipes, please read the **[Architecture Guide (ARCHITECTURE.md)](ARCHITECTURE.md)**.
