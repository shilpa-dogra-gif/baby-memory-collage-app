# Baby Memory Collage App

This is a Flutter mobile app for creating baby milestone and holiday photo collages with AI-powered suggestions and cloud-based theme management.

## Features

- User authentication (Email/Password, Google Sign-in) via Firebase
- Baby age setup and dynamic milestone suggestions
- Camera and photo library permissions
- On-device baby face detection and photo clustering
- Collage generator with multiple layouts and overlays
- Cloud-hosted background themes with remote config
- AI-powered theme suggestions based on baby age and date
- Offline support for previously downloaded themes
- Responsive and user-friendly UI/UX flow

## Tech Stack

- Flutter (cross-platform mobile)
- Firebase (Authentication, Cloud Storage, Firestore)
- MediaPipe / FaceNet for on-device face detection
- Custom Flutter widgets for collage layouts

## Setup

1. Install Flutter SDK: https://flutter.dev/docs/get-started/install
2. Set up Firebase project and enable Authentication, Firestore, and Storage
3. Configure Firebase in the Flutter app (google-services.json / GoogleService-Info.plist)
4. Run `flutter pub get` to install dependencies
5. Run the app on an emulator or device

## Development Roadmap

- Authentication screens and logic
- Baby profile setup and age calculation
- Permissions handling
- Photo gallery with baby face filtering
- Collage editor and generator
- Theme manager with remote config
- AI-powered suggestions
- Export and sharing functionality
- Offline support

## Testing

Refer to the Testing Checklist in the requirements document for detailed test cases.
