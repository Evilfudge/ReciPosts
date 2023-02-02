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
    apiKey: 'AIzaSyA3sxUDmHiY4wjuWNBdedG-jpafKbmQ5Sg',
    appId: '1:1030451409304:web:1487ee477d9ada2a403bed',
    messagingSenderId: '1030451409304',
    projectId: 'reciposts-7b5e1',
    authDomain: 'reciposts-7b5e1.firebaseapp.com',
    storageBucket: 'reciposts-7b5e1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARqknvkOFYyZzMr7HGxs0peNjCR5JsMrU',
    appId: '1:1030451409304:android:6312c87802849bf0403bed',
    messagingSenderId: '1030451409304',
    projectId: 'reciposts-7b5e1',
    storageBucket: 'reciposts-7b5e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuH64CFlFQGzL2HZJNaf2d9PV7FJxSnbE',
    appId: '1:1030451409304:ios:65ec33ae3bc548b6403bed',
    messagingSenderId: '1030451409304',
    projectId: 'reciposts-7b5e1',
    storageBucket: 'reciposts-7b5e1.appspot.com',
    iosClientId: '1030451409304-ahimukb19l9dr2hcmoq1d4l7osegujin.apps.googleusercontent.com',
    iosBundleId: 'com.reciposts.reciposts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuH64CFlFQGzL2HZJNaf2d9PV7FJxSnbE',
    appId: '1:1030451409304:ios:65ec33ae3bc548b6403bed',
    messagingSenderId: '1030451409304',
    projectId: 'reciposts-7b5e1',
    storageBucket: 'reciposts-7b5e1.appspot.com',
    iosClientId: '1030451409304-ahimukb19l9dr2hcmoq1d4l7osegujin.apps.googleusercontent.com',
    iosBundleId: 'com.reciposts.reciposts',
  );
}