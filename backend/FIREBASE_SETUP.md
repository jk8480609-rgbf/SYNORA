# Backend setup checklist
1. Create a Firebase project and enable Authentication providers for Email/Password and Phone.
2. Configure email verification and password reset templates.
3. Register Android and iOS app identifiers; run FlutterFire configuration.
4. Design Firestore collections: users, posts, stories, reels, comments, follows, likes, reports, notifications.
5. Keep admin privileges in trusted server-managed custom claims; never accept `isAdmin` from a client.
6. Implement Cloud Functions or a trusted API for moderation actions, account suspension, badge grants and audit logs.
7. Add Storage upload validation, file size limits, MIME checks, malware scanning where appropriate, and video processing.
8. Replace deny-all rules only after writing and testing a least-privilege access matrix.
