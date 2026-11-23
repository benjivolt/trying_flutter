# SkillMax

An early Flutter prototype of a calisthenics skill-training app. It signs users in with Firebase Auth, stores progress in Cloud Firestore and handles subscriptions through RevenueCat. State is managed with Riverpod.

## Run it

You need the Flutter SDK (Dart 3.10 or later) and a Firebase project. Generate `lib/firebase_options.dart` for your own project with the FlutterFire CLI, then:

```
flutter pub get
flutter run
```

## Layout

```
lib/main.dart          app entry point and Firebase setup
lib/views/             screens
lib/controllers/       subscription logic
```
