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
    apiKey: 'AIzaSyCvxqKEhRAoa7wqh7rkdPSmT-ufGXKP7fE',
    appId: '1:404245265618:web:28fa5f143635a83f75c10b',
    messagingSenderId: '404245265618',
    projectId: 'singular-flutter-app',
    authDomain: 'singular-flutter-app.firebaseapp.com',
    storageBucket: 'singular-flutter-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1nCIBPQ76BR5FFzqLEE5swIdvAc1dSkQ',
    appId: '1:404245265618:android:95aec57cd10567f575c10b',
    messagingSenderId: '404245265618',
    projectId: 'singular-flutter-app',
    storageBucket: 'singular-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsli36tccEoTp7sPq9Fz1cuvGsBoWOwF0',
    appId: '1:404245265618:ios:cf3b0fc614ed40ef75c10b',
    messagingSenderId: '404245265618',
    projectId: 'singular-flutter-app',
    storageBucket: 'singular-flutter-app.appspot.com',
    iosBundleId: 'com.jason.flutterapp',
  );
}