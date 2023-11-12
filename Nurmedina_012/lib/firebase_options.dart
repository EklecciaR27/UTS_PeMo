// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJepvAqnWT1pT9kyux8zd6-Tf0HJjQ6OM',
    appId: '1:32342543673:web:fd1782f9d783e861ecece8',
    messagingSenderId: '32342543673',
    projectId: 'flutix-kel3',
    authDomain: 'flutix-kel3.firebaseapp.com',
    storageBucket: 'flutix-kel3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrLw3ZxhMt81nbkIf8DG90Ivz9BsCRiCo',
    appId: '1:32342543673:android:033a9808be5ff0aaecece8',
    messagingSenderId: '32342543673',
    projectId: 'flutix-kel3',
    storageBucket: 'flutix-kel3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwa2pihZinR0k5LYUARAH3z9L8TXajoT4',
    appId: '1:32342543673:ios:04da1e7492701aa3ecece8',
    messagingSenderId: '32342543673',
    projectId: 'flutix-kel3',
    storageBucket: 'flutix-kel3.appspot.com',
    iosBundleId: 'com.example.main',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwa2pihZinR0k5LYUARAH3z9L8TXajoT4',
    appId: '1:32342543673:ios:e4b228fd36a76fe6ecece8',
    messagingSenderId: '32342543673',
    projectId: 'flutix-kel3',
    storageBucket: 'flutix-kel3.appspot.com',
    iosBundleId: 'com.example.main.RunnerTests',
  );
}