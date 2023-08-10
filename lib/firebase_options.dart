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
    apiKey: 'AIzaSyB_VO_2ZU33T7XTieQV-8w_l2W-y1e5Myc',
    appId: '1:74329695970:web:7054fb04cd4022b9e3e0bb',
    messagingSenderId: '74329695970',
    projectId: 'flutterfcm-74909',
    authDomain: 'flutterfcm-74909.firebaseapp.com',
    storageBucket: 'flutterfcm-74909.appspot.com',
    measurementId: 'G-44S2BGFCSK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbBCdRl_Ac0bLLzJ_0Y__f0LJ94Wf2VRQ',
    appId: '1:74329695970:android:c2ab9234616e24b2e3e0bb',
    messagingSenderId: '74329695970',
    projectId: 'flutterfcm-74909',
    storageBucket: 'flutterfcm-74909.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQ_Z497aujrSGfd8T6sFlAR4AZs8DZREI',
    appId: '1:74329695970:ios:74bbbee1cad66a99e3e0bb',
    messagingSenderId: '74329695970',
    projectId: 'flutterfcm-74909',
    storageBucket: 'flutterfcm-74909.appspot.com',
    iosClientId: '74329695970-ps3dhmac5imh46ruldl1cfm94casmd39.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQ_Z497aujrSGfd8T6sFlAR4AZs8DZREI',
    appId: '1:74329695970:ios:5724192f52db5e3ae3e0bb',
    messagingSenderId: '74329695970',
    projectId: 'flutterfcm-74909',
    storageBucket: 'flutterfcm-74909.appspot.com',
    iosClientId: '74329695970-2jph55ka2k745o0sdosi9ejl1bo44u1q.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationFlutter.RunnerTests',
  );
}
