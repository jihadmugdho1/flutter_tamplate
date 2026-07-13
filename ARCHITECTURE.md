# Flutter Clean Architecture Template — Engineering Guide

This document is the definitive guide on **how** this repository is structured. We follow a strict **Feature-First Clean Architecture** utilizing **GetX** for state management, dependency injection, and routing.

> **TL;DR:** Every feature is isolated in `lib/features/<name>/` and divided strictly into **Domain**, **Data**, and **Presentation** layers. Cross-feature utilities live in `lib/core/`.

---

## 1. Guiding Principles

1. **Feature Isolation:** Features never cross-import. Shared widgets or models belong in `lib/core/`.
2. **Dependency Rule:** `Presentation` depends on `Domain`. `Data` depends on `Domain`. `Domain` depends on **nothing**.
3. **Thin UI & Controllers:** Widgets only observe state. Controllers do not make API calls directly; they call `UseCases`.
4. **Design Tokens:** Hardcoded colors, font sizes, or paddings are strictly forbidden in UI files. Always use `AppColors` and `Sizer` extensions.

---

## 2. High-Level Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                         Presentation                           │
│   (UI & State) Widgets + GetxControllers                       │
└──────────────┬─────────────────────────────────────────────────┘
               │ Controllers call UseCases
┌──────────────▼─────────────────────────────────────────────────┐
│                           Domain                               │
│   (Business Logic) Entities, Repository Interfaces, UseCases   │
└──────────────▲─────────────────────────────────────────────────┘
               │ Data Repositories implement Domain Interfaces
┌──────────────┴─────────────────────────────────────────────────┐
│                            Data                                │
│   (External) DataSources, Repository Implementations, Models   │
└──────────────┬─────────────────────────────────────────────────┘
               │ Uses Core Services
┌──────────────▼─────────────────────────────────────────────────┐
│                  Application / Core Layer                      │
│   NetworkCaller, StorageService, ThemeController, Sizer        │
└────────────────────────────────────────────────────────────────┘
```

---

## 3. Standardized Feature Layout

Every feature under `lib/features/` **must** strictly adhere to this exact folder skeleton:

```text
features/<feature_name>/
├── data/                 # External communication and parsing
│   ├── datasources/      # Remote (API) or Local (DB) API calls
│   ├── models/           # DTOs that map JSON and extend Domain Entities
│   └── repositories/     # Concrete implementations of Domain Interfaces
├── domain/               # Pure business logic (No Flutter/GetX dependencies)
│   ├── entities/         # Core business data structures
│   ├── repositories/     # Abstract interfaces for data access
│   └── usecases/         # Specific application business rules (e.g. LoginUseCase)
├── presentation/         # UI and State Management
│   ├── controllers/      # GetxControllers (Executes UseCases, updates UI state)
│   ├── screens/          # Full routed screens
│   └── widgets/          # UI components private to this feature
└── bindings/             # GetX Bindings to wire Data -> Domain -> Presentation
```

---

## 4. State Management, DI, & Routing (GetX)

We use GetX for three specific roles:

| Role | Implementation | Rule |
|------|----------------|------|
| **State** | `.obs` and `Obx` | Keep reactive state minimal. Use `Rx<T>` inside Controllers. |
| **DI** | `Bindings` and `Get.find` | Never use global bindings for features. Lazy load via route bindings. |
| **Routing** | `GetPage` and `Get.toNamed`| Register all routes in `lib/routes/app_routes.dart`. Navigate by name. |

---

## 5. Core Services (`lib/core/`)

- **Networking:** All HTTP traffic must pass through `NetworkCaller` (`core/services/network/`). Never instantiate `Dio` in a feature.
- **Persistence:** All key/value storage goes through `StorageService` (`core/services/cache/`).
- **Theming:** Colors are in `AppColors`, typography in `AppTextStyle`. 
- **Sizing:** Use `.w`, `.h`, `.sp`, `.r` extensions (from `Sizer`) for all dimensions.

---

## 6. Developer Workflows

### How to add a new Feature Module
1. Run `mkdir -p lib/features/<name>/{data/{datasources,models,repositories},domain/{entities,repositories,usecases},presentation/{controllers,screens,widgets},bindings}`.
2. Define the **Entity** and **Repository Interface** inside `domain/`.
3. Create a **UseCase** in `domain/usecases/` that relies on the interface.
4. Build the **RemoteDataSource** and **RepositoryImpl** in `data/`.
5. Create a **GetxController** in `presentation/controllers/` that calls the UseCase.
6. Build your **Screen** in `presentation/screens/`.
7. Wire it all together in a `Binding` class (inject DataSource -> Repository -> UseCase -> Controller).
8. Add the screen and binding to `lib/routes/app_routes.dart`.

### Quality Checks
- Run `flutter analyze` before committing. The CI/CD pipeline expects **0 warnings**.
- Keep PRs scoped and branch names standardized (`feat/`, `fix/`, `chore/`).
