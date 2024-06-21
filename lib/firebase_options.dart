// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBmeuFJCKfwpib9fPvxuf-26JFVrjwtY_E',
    appId: '1:212806352843:web:85145665f9f6498fe0804e',
    messagingSenderId: '212806352843',
    projectId: 'flutterstore-c04a9',
    authDomain: 'flutterstore-c04a9.firebaseapp.com',
    storageBucket: 'flutterstore-c04a9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6VEP_YSi_yywJ9lroXY5XGhGj0kq7kQY',
    appId: '1:212806352843:android:1fb715c20bcc591de0804e',
    messagingSenderId: '212806352843',
    projectId: 'flutterstore-c04a9',
    storageBucket: 'flutterstore-c04a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxcZxmYTNHY_Q1SEKXUV_jdSibaDG05iQ',
    appId: '1:212806352843:ios:99bc49d65a8606e1e0804e',
    messagingSenderId: '212806352843',
    projectId: 'flutterstore-c04a9',
    storageBucket: 'flutterstore-c04a9.appspot.com',
    androidClientId: '212806352843-0u8jlnur5u5i0ef7j9nrfslkpuu8rc3d.apps.googleusercontent.com',
    iosClientId: '212806352843-2gc67c7v6s7krj6h4dhrfu88b3oj2jf9.apps.googleusercontent.com',
    iosBundleId: 'com.example.myStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmeuFJCKfwpib9fPvxuf-26JFVrjwtY_E',
    appId: '1:212806352843:web:6f37a4fa5af7d798e0804e',
    messagingSenderId: '212806352843',
    projectId: 'flutterstore-c04a9',
    authDomain: 'flutterstore-c04a9.firebaseapp.com',
    storageBucket: 'flutterstore-c04a9.appspot.com',
  );

}