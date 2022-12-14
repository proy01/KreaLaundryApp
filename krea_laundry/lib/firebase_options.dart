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
    apiKey: 'AIzaSyCo5G4yEy0Mt-aBUqwGtXZHG5vcy5PWcLo',
    appId: '1:1041697943348:web:ef4a9293c1d16257163f61',
    messagingSenderId: '1041697943348',
    projectId: 'krea-laundry-app',
    authDomain: 'krea-laundry-app.firebaseapp.com',
    databaseURL: 'https://krea-laundry-app-default-rtdb.firebaseio.com',
    storageBucket: 'krea-laundry-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnoeUWc5WgpjBTsdtQ-KZEpevhqN2x3Jg',
    appId: '1:1041697943348:android:1de24584fcc31896163f61',
    messagingSenderId: '1041697943348',
    projectId: 'krea-laundry-app',
    databaseURL: 'https://krea-laundry-app-default-rtdb.firebaseio.com',
    storageBucket: 'krea-laundry-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwia4KlaFcGQwOI3uiUyUYBifd37cS1X8',
    appId: '1:1041697943348:ios:cecc11103e8b7114163f61',
    messagingSenderId: '1041697943348',
    projectId: 'krea-laundry-app',
    databaseURL: 'https://krea-laundry-app-default-rtdb.firebaseio.com',
    storageBucket: 'krea-laundry-app.appspot.com',
    androidClientId: '1041697943348-5bkjao45hjfb0925tur84qvel3j7s4no.apps.googleusercontent.com',
    iosClientId: '1041697943348-q92mn6u3uho8do77lgfqj0jpd29ljamk.apps.googleusercontent.com',
    iosBundleId: 'com.example.kreaLaundry',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwia4KlaFcGQwOI3uiUyUYBifd37cS1X8',
    appId: '1:1041697943348:ios:cecc11103e8b7114163f61',
    messagingSenderId: '1041697943348',
    projectId: 'krea-laundry-app',
    databaseURL: 'https://krea-laundry-app-default-rtdb.firebaseio.com',
    storageBucket: 'krea-laundry-app.appspot.com',
    androidClientId: '1041697943348-5bkjao45hjfb0925tur84qvel3j7s4no.apps.googleusercontent.com',
    iosClientId: '1041697943348-q92mn6u3uho8do77lgfqj0jpd29ljamk.apps.googleusercontent.com',
    iosBundleId: 'com.example.kreaLaundry',
  );
}
