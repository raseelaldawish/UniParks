import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCAGZVoUFHGclqJHjtac31tI6wMxss40MA",
            authDomain: "uniparks.firebaseapp.com",
            projectId: "uniparks",
            storageBucket: "uniparks.appspot.com",
            messagingSenderId: "228561404309",
            appId: "1:228561404309:web:9e2a664070f20a04a4769c",
            measurementId: "G-4MDNHFCJ96"));
  } else {
    await Firebase.initializeApp();
  }
}
