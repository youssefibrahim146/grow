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
        return macos;
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
    apiKey: 'AIzaSyD7q4SzQQU6bUbmRXE_rjfcJ5t3w-0tBmY',
    appId: '1:300770310050:web:05a3fe104bba4c02f364fb',
    messagingSenderId: '300770310050',
    projectId: 'grow-e2402',
    authDomain: 'grow-e2402.firebaseapp.com',
    storageBucket: 'grow-e2402.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ3D9vxaMRkfg05myxkWTgI1MQBSahSUA',
    appId: '1:300770310050:android:05c97aadf74e60e8f364fb',
    messagingSenderId: '300770310050',
    projectId: 'grow-e2402',
    storageBucket: 'grow-e2402.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtE5_lY7h1EoWChCr2ShxNy8WF4kDXlUM',
    appId: '1:300770310050:ios:a4151b4076d8096cf364fb',
    messagingSenderId: '300770310050',
    projectId: 'grow-e2402',
    storageBucket: 'grow-e2402.firebasestorage.app',
    iosBundleId: 'com.example.grow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtE5_lY7h1EoWChCr2ShxNy8WF4kDXlUM',
    appId: '1:300770310050:ios:a4151b4076d8096cf364fb',
    messagingSenderId: '300770310050',
    projectId: 'grow-e2402',
    storageBucket: 'grow-e2402.firebasestorage.app',
    iosBundleId: 'com.example.grow',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7q4SzQQU6bUbmRXE_rjfcJ5t3w-0tBmY',
    appId: '1:300770310050:web:f247f68ff66851e8f364fb',
    messagingSenderId: '300770310050',
    projectId: 'grow-e2402',
    authDomain: 'grow-e2402.firebaseapp.com',
    storageBucket: 'grow-e2402.firebasestorage.app',
  );
}
