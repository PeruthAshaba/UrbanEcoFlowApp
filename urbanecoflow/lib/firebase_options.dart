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
    apiKey: 'AIzaSyDoGZ0Wzmoufi29peTO-ynPsQuw-CBqNbI',
    appId: '1:153993018766:web:f2a6c51477968a2873b8df',
    messagingSenderId: '153993018766',
    projectId: 'urbanecoflow',
    authDomain: 'urbanecoflow.firebaseapp.com',
    storageBucket: 'urbanecoflow.appspot.com',
    measurementId: 'G-W0BNHGWJ8S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANUs4l67YT0Ccc9VUHglcN1pRY-38wTOk',
    appId: '1:153993018766:android:2f6eaee644ba5bdd73b8df',
    messagingSenderId: '153993018766',
    projectId: 'urbanecoflow',
    storageBucket: 'urbanecoflow.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB4-3PWN-ENjxI-MGEGuMyrVX1zxpOA2w',
    appId: '1:153993018766:ios:566c8766f504f82573b8df',
    messagingSenderId: '153993018766',
    projectId: 'urbanecoflow',
    storageBucket: 'urbanecoflow.appspot.com',
    iosBundleId: 'com.example.urbanecoflow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDB4-3PWN-ENjxI-MGEGuMyrVX1zxpOA2w',
    appId: '1:153993018766:ios:5b08c47b96bbc49c73b8df',
    messagingSenderId: '153993018766',
    projectId: 'urbanecoflow',
    storageBucket: 'urbanecoflow.appspot.com',
    iosBundleId: 'com.example.urbanecoflow.RunnerTests',
  );
}