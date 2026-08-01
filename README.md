<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=229cc9&height=250&section=header&text=Rehlaa%20%7C%20%D8%B1%D8%AD%D9%84%D8%A9&fontSize=80&fontColor=ffffff&animation=fadeIn&fontAlignY=35" width="100%" alt="Rehlaa Header" />

  <br />
  
  <strong>Rehlaa — A Modern Flutter Marketplace Application for Android and iOS.</strong>
  
  <br />
  <br />

  <!-- Badges -->
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Flutter-3.41.2-02569B?logo=flutter&logoColor=white&style=for-the-badge" alt="Flutter Version" />
  </a>
  <a href="https://dart.dev">
    <img src="https://img.shields.io/badge/Dart-3.11.0-0175C2?logo=dart&logoColor=white&style=for-the-badge" alt="Dart Version" />
  </a>
  <a href="https://riverpod.dev">
    <img src="https://img.shields.io/badge/Riverpod-2.5.1-1A73E8?logo=dart&logoColor=white&style=for-the-badge" alt="Riverpod" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/Architecture-Clean_MVVM-C94F22?style=for-the-badge" alt="Architecture" />
  </a>
  <br />
  <a href="#">
    <img src="https://img.shields.io/badge/Status-Development-FFC107?style=flat-square" alt="Status" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-4CAF50?style=flat-square" alt="Platforms" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" alt="License" />
  </a>
</div>

<hr />

## 📖 About

**Rehlaa (رحلة)** is a modern marketplace application built with [Flutter](https://flutter.dev). It aims to deliver a seamless and contemporary user experience built upon a clean, scalable architecture. The project features full RTL and LTR support (Arabic and English) and a completely custom Design System.

---

## 🏗️ Architecture

The project relies on a **Feature-first Clean MVVM** architecture, ensuring feature independence, scalability, and testability.

### Key Layers:
1. **Presentation:** Pages, Widgets, and ViewModels (State Management).
2. **Domain:** Entities, Repository Contracts, and Complex Use Cases.
3. **Data:** Data Sources (Remote/Local/Mock), Repository Implementations, and Mappers.

### Tech Stack:
- **State Management:** `Riverpod` (utilizing `Notifier` and `AsyncNotifier`)
- **Routing:** `go_router` (with `StatefulShellRoute` support)
- **Code Generation:** `freezed_annotation`, `json_annotation`, `riverpod_generator`
- **Localization:** `gen_l10n` and `intl` (Full ARB support)
- **Design System:** Custom Design System based on semantic tokens (colors, typography, spacing) for precise Light/Dark mode execution.

---

## 📂 Folder Structure

```text
lib/
├── app/                  # Core App Configurations and Shell
├── bootstrap/            # App Initialization, Environments, and Provider Observer
├── core/                 # Core Components (Design System, Network, Storage, Utils)
├── features/             # Independent Features (Home, Auth, Wallet, Checkout...)
├── shared/               # Shared Domain & Presentation Components
├── l10n/                 # Localization Files (ARB)
└── main.dart             # Entry Point
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter](https://docs.flutter.dev/get-started/install) version `3.41.2` or newer.
- [Dart](https://dart.dev/get-dart) version `3.11.0` or newer.

### Running the App

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/rehlaa.git
   cd rehlaa
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate boilerplate code (Riverpod, Freezed, JSON Serializable):**
   ```bash
   dart run build_runner build -d
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🎨 Design System

The project incorporates a comprehensive design system that ensures visual consistency across the app:
- **Semantic Colors:** Relies on the primary semantic orange color `#C94F22` for Light Mode and `#FF9A73` for Dark Mode.
- **Typography:** Uses **Plus Jakarta** for Latin content and **Cairo** for Arabic content.
- **Components:** A wide range of ready-to-use semantic components such as `AppScaffold`, `AppPrimaryButton`, `AppTextField`, `AppCard`, and more.

---

## 🗺️ Roadmap & Status

- [x] **Core Foundation:** Environment setup, Result/Failure handling, and initial Storage system.
- [x] **Design System:** Base components and Light/Dark mode integration (Being refined for exact match).
- [x] **Authentication:** Login, Register, Forgot Password (Integration ongoing).
- [ ] **Home & Catalog:** Product browsing, offers, and categories (Restructuring to bind with ViewModel).
- [ ] **Cart & Checkout:** Cart management and advanced checkout flows.
- [ ] **Wallet:** Digital wallet system, balance management, and top-ups.
- [ ] **Profile & Orders:** User account management and detailed order tracking.
- [ ] **Quality:** 100% `flutter analyze` compliance, Integration Tests, and CI/CD pipelines.

---

## 🤝 Contributing

We welcome all contributions! Please ensure your code complies with the project's **Feature-first Clean MVVM** architecture. Run `flutter analyze` and ensure all tests pass successfully before submitting any Pull Request.

---

<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=229cc9&height=150&section=footer&text=Made%20with%20%E2%9D%A4%EF%B8%8F%20by%20Rehlaa%20Team&fontSize=30&fontColor=ffffff&animation=fadeIn&fontAlignY=70" width="100%" alt="Rehlaa Footer" />
</div>
