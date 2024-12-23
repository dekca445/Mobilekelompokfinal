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
    apiKey: 'AIzaSyDj23kjTYN9rvkwwiIp-uu0M890ycDM5hM',
    appId: '1:854568354748:web:072b2f65bdc7db16f421b9',
    messagingSenderId: '854568354748',
    projectId: 'simpanpinjam-30',
    authDomain: 'simpanpinjam-30.firebaseapp.com',
    storageBucket: 'simpanpinjam-30.firebasestorage.app',
    measurementId: 'G-0BWQX10H2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoDaDoThK0pMeG6EyDPjuendcYR3Kmvm0',
    appId: '1:854568354748:android:dedb1593bb1ee238f421b9',
    messagingSenderId: '854568354748',
    projectId: 'simpanpinjam-30',
    storageBucket: 'simpanpinjam-30.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj16zjIXH6aIw1jndjAoSFVgmpyIqksrk',
    appId: '1:854568354748:ios:3665303962058a4ff421b9',
    messagingSenderId: '854568354748',
    projectId: 'simpanpinjam-30',
    storageBucket: 'simpanpinjam-30.firebasestorage.app',
    iosBundleId: 'com.example.testing1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBj16zjIXH6aIw1jndjAoSFVgmpyIqksrk',
    appId: '1:854568354748:ios:3665303962058a4ff421b9',
    messagingSenderId: '854568354748',
    projectId: 'simpanpinjam-30',
    storageBucket: 'simpanpinjam-30.firebasestorage.app',
    iosBundleId: 'com.example.testing1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDj23kjTYN9rvkwwiIp-uu0M890ycDM5hM',
    appId: '1:854568354748:web:22e83aeb7ada8ba6f421b9',
    messagingSenderId: '854568354748',
    projectId: 'simpanpinjam-30',
    authDomain: 'simpanpinjam-30.firebaseapp.com',
    storageBucket: 'simpanpinjam-30.firebasestorage.app',
    measurementId: 'G-Z8C3VPPB79',
  );
}
