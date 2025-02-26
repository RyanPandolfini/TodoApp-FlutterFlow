import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBVSlWvBmlRXhf7VLrC1GdlROVNyK5zHRc",
            authDomain: "todo-h45mky.firebaseapp.com",
            projectId: "todo-h45mky",
            storageBucket: "todo-h45mky.firebasestorage.app",
            messagingSenderId: "925275456083",
            appId: "1:925275456083:web:c1ffb6e91b1b7e52c8bca6",
            measurementId: "G-DFBW309QLG"));
  } else {
    await Firebase.initializeApp();
  }
}
