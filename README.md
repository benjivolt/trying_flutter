# SkillMax

A Flutter subscription prototype for a calisthenics training app. The current screen shows RevenueCat entitlement status, opens paywalls and the customer center, and restores purchases. Riverpod manages subscription state; Firebase initializes at startup.

Account sign-in, exercise tracking, and saved training progress remain future work.

## Local setup

Use Flutter 3.47+ with Dart 3.13 or newer, a Firebase project, and a RevenueCat project.

1. Run `flutterfire configure` to generate `lib/firebase_options.dart` for your project and target platforms.
2. Replace the prototype's RevenueCat test-store public SDK key in `lib/controllers/subscription_controller.dart` with the appropriate public SDK key for your project. Configure the `SkillMax Premium` entitlement and offerings in RevenueCat.
3. Install packages and launch the app:

```bash
flutter pub get
flutter run
```

Use public mobile SDK configuration in the app. Keep RevenueCat secret API keys, Firebase service-account credentials, and signing keystores outside version control. Configure production signing before distributing Android builds; the current Android setup is for local prototype development.

## Firebase security configuration

Firebase client API keys identify a project; access to data is controlled by Security Rules and App Check. Review the project in Google Cloud and Firebase before distributing the app: restrict each client key to the required Firebase APIs, keep the Gemini API on a separate private server key, and configure rules and App Check for the products you enable.

See [Firebase API-key guidance](https://firebase.google.com/docs/projects/api-keys). These account settings are managed separately from this repository.

## Checks

```bash
flutter analyze
flutter test
```

The widget test overrides the subscription controller, so it checks the restore-purchases interaction without calling Firebase or RevenueCat.

## Layout

```text
lib/main.dart                          app entry point and Firebase initialization
lib/views/home_view.dart               subscription controls and entitlement status
lib/controllers/subscription_controller.dart
                                       RevenueCat integration and Riverpod state
test/widget_test.dart                  subscription screen regression test
```
