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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBc_vSS4fA4hN8NQA7Fr6QmHfwBY05xR4U',
    appId: '1:626022765104:web:f084d085b490d2965853f5',
    messagingSenderId: '626022765104',
    projectId: 'tech-5b07d',
    authDomain: 'tech-5b07d.firebaseapp.com',
    storageBucket: 'tech-5b07d.appspot.com',
    measurementId: 'G-8ESQJGRWQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2jo3jCUnmYCbf9ExTrLZmrawdMFoU3Nw',
    appId: '1:626022765104:android:8e5adb2ccb156d665853f5',
    messagingSenderId: '626022765104',
    projectId: 'tech-5b07d',
    storageBucket: 'tech-5b07d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPXQxwYB2kK4cayKPLqnfhOiAltYehTdw',
    appId: '1:626022765104:ios:9ef7a36fa4b91d865853f5',
    messagingSenderId: '626022765104',
    projectId: 'tech-5b07d',
    storageBucket: 'tech-5b07d.appspot.com',
    iosClientId: '626022765104-sqsj5dv2bbjsntt7cekrg66i1251l57l.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTask',
  );
}