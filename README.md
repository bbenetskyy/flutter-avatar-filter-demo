# Flutter Avatar Filter Demo

A Flutter project demonstrating a clean, maintainable, and efficient avatar filtering flow using GetX and Clean Architecture principles.

## 🚀 Overview

This project showcases a UI for browsing avatars with advanced filtering capabilities (Gender, Age Group, and Pose). It follows a simplified Clean Architecture to ensure separation of concerns while keeping the implementation pragmatic for a take-home task or a small feature demo.

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev)
- **State Management:** [GetX](https://pub.dev/packages/get)
- **Assets:** SVG icons (flutter_svg) and PNG avatars.
- **Localization:** Standard Flutter l10n (AppLocalizations).

## 🏗 Architecture

The project is organized into a simplified Clean Architecture structure:

### 1. Domain Layer (`lib/features/avatars/domain`)
- **Entities:** Plain Dart classes representing the core business models (e.g., `Avatar`).
- **Enums:** Strongly typed filters (`AvatarGender`, `AvatarAgeGroup`, `AvatarPose`).
- **Use Cases:** Simple classes containing specific business logic (e.g., `GetAvatarsUseCase`).
- **Repository Interfaces:** Abstract definitions of data operations.

### 2. Data Layer (`lib/features/avatars/data`)
- **Models:** Data Transfer Objects (DTOs) with JSON/Entity mapping logic.
- **Data Sources:** Handle raw data fetching (currently simulated in `AvatarDataSource`).
- **Repositories:** Implementation of domain repository interfaces, coordinating data sources.

### 3. Presentation Layer (`lib/features/avatars/presentation`)
- **Pages:** Main screens (e.g., `AvatarPage`).
- **Controllers:** GetX controllers managing state and local UI logic.
- **Widgets:** Reusable UI components, extracted for clarity and maintainability.
- **Bindings:** Dependency injection setup using GetX.

## 🧠 Key Logic: Local Filtering

To ensure a smooth and responsive user experience, this project implements **Local In-Memory Filtering**:

1.  **Single Source of Truth:** `AvatarController` is the owner of both the raw data and the filtered state.
2.  **Initial Load:** All avatars are fetched once from the repository and stored in `allAvatars`.
3.  **Local Processing:** When a user updates a filter, the controller recalculates the `filteredAvatars` list locally from `allAvatars` without re-triggering network/repository calls.
4.  **Reactivity:** GetX's `Obx` and `RxList` are used to automatically update the UI whenever the filtered list or selection state changes.

## 📂 Project Structure

```text
lib/
├── features/
│   └── avatars/
│       ├── data/           # Models, Repositories, DataSources
│       ├── domain/         # Entities, UseCases, Enums
│       └── presentation/   # Pages, Controllers, Widgets, Bindings
├── l10n/                   # Localization files
├── style/                  # App theme, colors, and dimensions
└── main.dart               # Entry point
```

## 🧹 Recent Refactors

- **Controller Consolidation:** Merged `FilterController` into `AvatarController` to simplify state management and reduce unnecessary coupling.
- **Clean API:** Simplified the Repository and UseCase layers by removing outdated filter parameters, moving filtering responsibility entirely to the presentation layer for better performance.
- **Decoupled Widgets:** Extracted public widgets (like `AppCheckbox` and `HeaderFilterChip`) to separate files, ensuring a "one widget per file" structure for better reusability.
- **Improved Empty State:** The `EmptyStateWidget` is now a generic component that accepts callbacks, making it independent of specific controllers.
