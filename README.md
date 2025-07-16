# Dogfy Diet App

A multi-step onboarding mobile application built with Flutter, implementing Clean Architecture principles, multi-language support, and native integrations.

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (>=3.6.0)
- Dart SDK (>=3.6.0)
- Android Studio / VS Code

### Installation & Run

```bash
# Clone and install
git clone https://github.com/DanielRomanMartinez/dogfydiet_app.git
cd dogfydiet_app
flutter pub get

# Generate code
flutter packages pub run build_runner build

# Run the app
flutter run
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate documentation
dart doc
```
## 🛠️ Tech Stack

### Core Architecture
- **Clean Architecture** with DDD principles
- **Riverpod** (2.6.1) + **Riverpod Generator** (2.6.5) - Type-safe state management with code generation
- **Go Router** (16.0.0) - Declarative routing with type safety
- **Equatable** (2.0.7) - Value equality for domain models

### Native Integrations
- **Geolocator** (14.0.2) + **Geocoding** (4.0.0) - Location services with address resolution
- **Permission Handler** (12.0.1) - Runtime permission management
- **SharedPreferences** (2.5.3) - Lightweight persistent storage

### Development & Quality
- **Mockito** (5.4.6) - Mock generation for testing
- **Flutter Lints** (6.0.0) - Strict code analysis rules
- **DartDoc** (8.3.4) - API documentation generation
- **Build Runner** (2.5.4) - Code generation pipeline

### Internationalization
- **Flutter Localizations** - Built-in i18n support
- **Intl** - Internationalization utilities

### Dependencies
- **flutter_riverpod** (2.6.1) - State management
- **go_router** (16.0.0) - Navigation
- **geolocator** (14.0.2) - Location services
- **shared_preferences** (2.5.3) - Local storage
- **flutter_svg** (2.2.0) - SVG support


## 🏗️ Architecture

Following **Clean Architecture** and **DDD** principles:

```
lib/
├── application/           # Application layer (screens)
│   └── screens/
├── domain/               # Domain layer (business logic)
│   ├── model/
│   ├── repositories/
│   └── services/
├── infrastructure/       # Infrastructure layer (external dependencies)
│   ├── repositories/
│   └── services/
├── ui/                   # UI layer (widgets & theme)
│   ├── common/
│   ├── screens/
│   └── theme/
└── config/              # Configuration & routing
```

## ❓ FAQs

### Why Riverpod over other state management solutions?
I noticed that with BLoC I was creating too many files and too much boilerplate. Riverpod is more concise and offers better type safety with less overhead.

### Why this folder structure?
I try to follow DDD principles, emphasizing the domain layer and decoupling from third-party dependencies. Clear separation between layers makes maintenance and testing easier.

### Why SharedPreferences for form state persistence?
It was sufficient for this use case. There's no need for a complex database like Hive or SQLite for something as "trivial" as saving form progress.

### Why use existing widgets for geolocation and permissions?
These are battle-tested widgets that are actively maintained. I don't consider it good practice to reinvent the wheel when proven solutions already exist.

### Why is it separated by home, with screens inside?
I've tried to separate sections as if they were within the bottom menu options. For example, to create a subscription, you access it from home, so it's inside the home folder.

### Why maintain the same folder structure in UI, tests, and application layers?
To make it easier to identify where everything is. If everything follows the same pattern, it's easier to remember where each thing is located. I also try to make it resemble the flow a user would follow in the application.

### Why did you add multi-language and dark/light themes?
I tried to make a more functional app, not just the onboarding form, but something closer to what Dogfy might have in mind for the future. The website has 3 languages, and I added one additional. Dark/light mode, despite not being fully polished, is a feature people often appreciate.

## 🌍 Internationalization

Soporte para múltiples idiomas:
- 🇬🇧 English
- 🇪🇸 Español
- 🇫🇷 Français
- 🇮🇹 Italiano