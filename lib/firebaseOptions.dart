import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBOjQbCH2Xqsz6GhQYmHrxESCFCZId-v9o',
    appId: '1:1022245254904:web:f6e2cf3b181b2880e26d0d',
    messagingSenderId: '1022245254904',
    projectId: 'bd-tamarutacagame',
    authDomain: 'bd-tamarutacagame.firebaseapp.com',
    storageBucket: 'bd-tamarutacagame.appspot.com',
    measurementId: 'G-7RM80KLDWC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDS7X7HB5Fu0OGA_IKaCf3OgOh1YQcgPaY',
    appId: '1:1022245254904:android:2d8c9743fdb40e42e26d0d',
    messagingSenderId: '1022245254904',
    projectId: 'bd-tamarutacagame',
    storageBucket: 'bd-tamarutacagame.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW-pAJfq5MORkBtOyNUMvDaGOfMXAPWmc',
    appId: '1:1022245254904:ios:86bc1f709656aea6e26d0d',
    messagingSenderId: '1022245254904',
    projectId: 'bd-tamarutacagame',
    storageBucket: 'bd-tamarutacagame.appspot.com',
    iosClientId: '1022245254904-m4n10kh9krcnjicfvbq03icl51ok1mcl.apps.googleusercontent.com',
    iosBundleId: 'com.example.flameteste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBW-pAJfq5MORkBtOyNUMvDaGOfMXAPWmc',
    appId: '1:1022245254904:ios:86bc1f709656aea6e26d0d',
    messagingSenderId: '1022245254904',
    projectId: 'bd-tamarutacagame',
    storageBucket: 'bd-tamarutacagame.appspot.com',
    iosClientId: '1022245254904-m4n10kh9krcnjicfvbq03icl51ok1mcl.apps.googleusercontent.com',
    iosBundleId: 'com.example.flameteste',
  );
}
