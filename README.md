# plypicker_flutter

A new Flutter project.

## Getting Started

- Create Firbase new project
- Set up Firebase Authentication and choose the authentication methods you want to use (e.g., email/password, Google, etc.).
- Download the Firebase configuration file (`google-services.json` for Android, `GoogleService-Info.plist` for iOS) and place it in the `android/app` and `ios/Runner` directories.

## Configure Flutter Project

- In `lib\shared\constants.dart` replace values with your values 

   ```bash
    class Constants{
    static String appId="YOUR APP ID";
    static String apiKey="YOUR API KEY";
    static String messagingSenderId="YOUR MESSAGING SENDER ID";
    static String projectId="YOUR PROJECTID";
  }

- Clone this repository:

   ```bash
   git clone https://github.com/Rajatg180/plypicker_flutter.git

- Navigate to the project directory
  ```bash
  cd plypicker_flutter

- Install dependencies:
  ```bash
  flutter pub get

- Run the app:
  ```bash
  flutter run


