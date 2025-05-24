🎵 S.Rocks.Music - Flutter Developer Intern Assignment
This is a mini Flutter project built for the S.Rocks.Music Intern Assignment. It replicates a simple Home Screen module from the main app, using clean architecture (MVVM), Firebase Firestore integration, and state management with Provider.

📱 Features
Displays music service cards (title, icon, description) fetched from Firebase Firestore

Tapping a card navigates to a screen saying:
“You tapped on: [Service Name]”

Follows MVVM architecture

Uses Provider for state management

Clean, responsive UI matching the Figma design

Includes Dependency Injection using get_it

🏗️ Folder Structure
css
Copy
Edit
lib/
├── features/
│   └── home_page/
│       ├── models/
│       │   └── service.dart
│       ├── repositories/
│       │   └── service_repository.dart
│       ├── viewmodels/
│       │   └── home_viewmodel.dart
│       └── views/
│           └── home_screen.dart
├── src/
│   ├── di/
│   │   └── locator.dart
│   └── routing/
│       └── router.dart
├── firebase_options.dart
└── main.dart
🔧 Technologies Used
Flutter

Firebase Firestore

Provider

get_it (Dependency Injection)

MVVM Architecture

Google Fonts

Flutter ScreenUtil (Responsive Design)

🚀 How to Run
Clone the repo:

bash
Copy
Edit
git clone https://github.com/your-username/srocks_music_app.git
cd srocks_music_app
Install dependencies:

bash
Copy
Edit
flutter pub get
Set up Firebase:

Add your own google-services.json (Android) or GoogleService-Info.plist (iOS)

Or use the provided firebase_options.dart if already configured

Run the app:

bash
Copy
Edit
flutter run
📹 Demo
[Include your screen recording or GIF link here]

✅ Assignment Checklist
✅ Recreated Home UI from Figma

✅ Fetched data dynamically from Firestore

✅ Navigation on card tap

✅ Used MVVM architecture

✅ Used Provider for state management

✅ Used get_it for dependency injection
