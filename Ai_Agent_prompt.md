# AI Agent Instructions

> **CRITICAL INSTRUCTION:** Before implementing any changes, you must read the entire project structure, specifically `ARCHITECTURE.md` and `README.md`. Fully understand the **Clean Architecture**, reusable components, coding patterns, naming conventions, and state management flow (GetX).

## 1. Pre-Implementation Checklist
Before writing any code, perform the following steps:
- [ ] **Analyze Flow:** Fully understand the feature/module flow you are about to modify.
- [ ] **Check for Reusability:** Search the `lib/core/` directory for existing reusable widgets, helpers, extensions, and design tokens (colors, sizing).
- [ ] **Avoid Duplication:** Do not create new logic or components if an equivalent utility already exists.
- [ ] **No Hardcoding:** Ensure no hardcoded strings, colors, or sizing values are used. Use existing design tokens.
- [ ] **Review Naming Conventions:** Ensure you understand the current snake_case and CamelCase standards.

## 2. Architecture & Separation of Concerns
Strictly adhere to the established Feature-First Clean Architecture:
- **Domain Layer:** Pure Dart only. Keep business rules in `usecases`, definitions in `entities`, and contracts in `repositories` interfaces.
- **Data Layer:** Handle all external logic here. Map JSON in `models`, write API calls in `datasources`, and implement interfaces in `repositories`.
- **Presentation Layer:** Controllers execute `usecases` and update state. Screens and widgets only observe state. Never make API calls or context-dependent logic directly from controllers.
- **UI Components:** Separate all reusable UI components into the dedicated `presentation/widgets/` folder of the feature, or `lib/core/common/` if shared globally.

## 3. Coding Standards & Best Practices
- **Consistency:** Follow my existing structured coding style consistently across the project.
- **Readability:** Write clean, optimized, scalable, and human-readable code.
- **Minimalism:** Keep the code minimal and avoid unnecessary complexity.
- **Responsiveness:** Use responsive and reusable UI patterns (`Sizer` extensions like `.w`, `.h`, `.sp`).
- **Performance:** Keep widget rebuilds minimal. Use `Obx` only around the specific widget that needs updating.

## 4. Expected Outcome
- A fully optimized, production-ready implementation.
- Strict adherence to Clean Architecture layers with reusable and maintainable components.
- A minimal yet highly scalable codebase following current project standards without duplication.