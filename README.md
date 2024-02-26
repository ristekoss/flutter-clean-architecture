# 👨‍💻 Ulas Kelas
[![Generic badge](https://img.shields.io/badge/Flutter-v3.16.1-blue)](https://flutter.dev/docs)
[![Generic badge](https://img.shields.io/badge/Dart-v3.2.1-blue)](https://dart.dev/guides)

Flutter Boilerplate

## ⚡️ Getting Started

### 🚚 How to run, drive, and build Apk

Example how to run development app
```
flutter clean
flutter pub get
flutter run -t lib/main.dart
```

Example how to run production app
```
flutter clean
flutter pub get
flutter build apk -t lib/main_production.dart
```

### ⚙️ Supported Flavor

1. staging
2. production

### 🎯 Architecture & Pattern

Reso coder's flutter clean architecture

![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

### 🧬️ State Management

Using BLoC for robust and battle proven state management

visit https://pub.dev/packages/flutter_bloc

### API Documentation

[DummyJson](https://dummyjson.com/docs/)

This boilerplate use DummyJson for remote data sources

### Versioning

Major-Minor-Patch

Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.
   Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

and also supported by [cider](https://pub.dev/packages/cider).

to patch: `cider bump patch --bump-build` or `make patch`
to minor: `cider bump minor --bump-build` or `make minor`
to major: `cider bump major --bump-build` or `make major`

### :capital_abcd: Naming Convention

snake_case for file and folder.

### :capital_abcd: Git flow

Commit rules:
(feat|fix|docs|style|refactor|perf|test|build|ci):\/*

feat: A new feature
fix: A bug fix
docs: Documentation only changes
style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
refactor: A code change that neither fixes a bug nor adds a feature
perf: A code change that improves performance
test: Adding missing tests
build: Changes to the build/compilation/packaging process or auxiliary tools such as documentation generation
ci: Changes in the continuous integration/delivery setup

examples:
feat(auth): Form Login
feat(product): implement product screen
ci: refactor analysis job

before push
1. flutter analyze
2. flutter test

branch rules:
(feature|hotfix|coldfix|service|integration|ui)\/\/*

### How to contribute

To help work on this project, please refer to [CONTRIBUTING.md](CONTRIBUTING.md)