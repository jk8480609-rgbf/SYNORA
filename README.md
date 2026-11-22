# SYNORA — Starter Project

This ZIP is a **starter codebase**, not a finished production Instagram clone.
It contains:
- `mobile/`: Flutter Android/iOS starter UI (login/create-account, home, stories, reels, search, profile).
- `admin/`: Separate responsive admin dashboard starter (overview, users, content moderation, settings).
- `backend/`: Firebase setup notes, Firestore rules and Storage rules templates.

## Requirements
- Flutter SDK (stable), Android Studio for Android builds, Xcode on macOS for iOS builds.
- Node.js 20+ and npm for the admin dashboard.
- A Firebase project for real authentication, database and media storage.

## Run the mobile app
```bash
cd mobile
flutter pub get
flutter run
```
The screens currently use demo/local placeholder data. Before real sign-in works, add Firebase:
1. Create a Firebase project.
2. Register Android and iOS apps in Firebase.
3. Install/configure FlutterFire CLI and run `flutterfire configure`.
4. Add `firebase_core` and `firebase_auth` packages, initialize Firebase, and implement phone/email auth flows.
5. Replace demo repositories with secured Firestore/Storage services.

## Run the separate admin dashboard
```bash
cd admin
npm install
npm run dev
```
Open the local URL printed by Vite. This is a UI prototype. Connect it to a secured backend before using it with real users.

## Important production work still required
- Real email/phone verification, password reset and account recovery.
- Secure backend authorization; never trust admin role flags from the client.
- Upload processing, video transcoding, feed ranking and pagination.
- Direct messages, notifications, reporting queues and moderation workflows.
- Privacy policy, terms, age-safety controls, abuse prevention, backups and monitoring.
- App signing, store assets, testing and deployment.

## Security warning
The included Firebase rules are restrictive templates. They are not a complete authorization design. Review and test them before deployment. Never put service-account keys or private secrets in this repository.
