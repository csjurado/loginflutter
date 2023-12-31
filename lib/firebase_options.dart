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
    apiKey: 'AIzaSyCzQ4cwdYDl2-9ifCWOaAyALVezYvMsEXI',
    appId: '1:140909791199:web:0257a29eeebefda95ee66a',
    messagingSenderId: '140909791199',
    projectId: 'ionic-8ebbe',
    authDomain: 'ionic-8ebbe.firebaseapp.com',
    databaseURL: 'https://ionic-8ebbe-default-rtdb.firebaseio.com',
    storageBucket: 'ionic-8ebbe.appspot.com',
    measurementId: 'G-QF3DW29CE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA865OdFyEpyldGGxJYRq9y_DmBM3C71vc',
    appId: '1:140909791199:android:83f12b18730e6d8f5ee66a',
    messagingSenderId: '140909791199',
    projectId: 'ionic-8ebbe',
    databaseURL: 'https://ionic-8ebbe-default-rtdb.firebaseio.com',
    storageBucket: 'ionic-8ebbe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhuSJtykt-5NaS4rprJNk1ZEZhqlGaOPE',
    appId: '1:140909791199:ios:ae67a4d482b0e27d5ee66a',
    messagingSenderId: '140909791199',
    projectId: 'ionic-8ebbe',
    databaseURL: 'https://ionic-8ebbe-default-rtdb.firebaseio.com',
    storageBucket: 'ionic-8ebbe.appspot.com',
    iosClientId: '140909791199-hqhsmg0rt9iia2fejr6o925gv95e8un9.apps.googleusercontent.com',
    iosBundleId: 'com.example.auenticacion',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhuSJtykt-5NaS4rprJNk1ZEZhqlGaOPE',
    appId: '1:140909791199:ios:7afdfac9dfb9cbb35ee66a',
    messagingSenderId: '140909791199',
    projectId: 'ionic-8ebbe',
    databaseURL: 'https://ionic-8ebbe-default-rtdb.firebaseio.com',
    storageBucket: 'ionic-8ebbe.appspot.com',
    iosClientId: '140909791199-8tmhcjcm7enbeoksdqv8frb18gfm9jo6.apps.googleusercontent.com',
    iosBundleId: 'com.example.auenticacion.RunnerTests',
  );
}
