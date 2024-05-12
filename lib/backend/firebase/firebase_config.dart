import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC8FK58CPTHXJ7aQj71icI5u_mqvf2jYYI",
            authDomain: "orbit-djwnx0.firebaseapp.com",
            projectId: "orbit-djwnx0",
            storageBucket: "orbit-djwnx0.appspot.com",
            messagingSenderId: "932557924533",
            appId: "1:932557924533:web:295757fa57085e2a6736fc"));
  } else {
    await Firebase.initializeApp();
  }
}
