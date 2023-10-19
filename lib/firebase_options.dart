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
    apiKey: 'AIzaSyCWj-vTj1yxXmEp1VKbCQ7NEwsNDidoRds',
    appId: '1:470467498747:web:e161fdd6c7870cba45d65e',
    messagingSenderId: '470467498747',
    projectId: 'productused',
    authDomain: 'productused.firebaseapp.com',
    storageBucket: 'productused.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7tvjpmWdSZyGY08sGB5pLccfFiz6x_yg',
    appId: '1:470467498747:android:940322843ed948af45d65e',
    messagingSenderId: '470467498747',
    projectId: 'productused',
    storageBucket: 'productused.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXNPR920hLFnOwgSYEHg_LejGSBps0yMo',
    appId: '1:470467498747:ios:d3213c6f089f1e8145d65e',
    messagingSenderId: '470467498747',
    projectId: 'productused',
    storageBucket: 'productused.appspot.com',
    iosBundleId: 'com.customer.manager.customerManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXNPR920hLFnOwgSYEHg_LejGSBps0yMo',
    appId: '1:470467498747:ios:04ed579f2132426945d65e',
    messagingSenderId: '470467498747',
    projectId: 'productused',
    storageBucket: 'productused.appspot.com',
    iosBundleId: 'com.customer.manager.customerManager.RunnerTests',
  );
}
