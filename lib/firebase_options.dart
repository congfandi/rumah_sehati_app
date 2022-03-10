// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBY7tfge5Wbc8mXwjg2QqKu2QR5h6az_NU',
    appId: '1:449285248001:android:317cf2e8b7d9c336765c00',
    messagingSenderId: '449285248001',
    projectId: 'rumah-sehati',
    storageBucket: 'rumah-sehati.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4CXD-xE1VGoywlpn4tp1O-rxD_DQg_BA',
    appId: '1:449285248001:ios:610eacafb69f8412765c00',
    messagingSenderId: '449285248001',
    projectId: 'rumah-sehati',
    storageBucket: 'rumah-sehati.appspot.com',
    iosClientId: '449285248001-ius04pt0j28uklpcl2phqp1355t68192.apps.googleusercontent.com',
    iosBundleId: 'com.pepdonggi.ruang.sehati',
  );
}
