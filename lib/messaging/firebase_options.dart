// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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
  
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        // return macos;
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


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAycd0KBR2EZ1Pt_HaqtRXqkTHs82gsMn0',
    appId: '1:929689339419:android:442fa81298665d74001abe',
    messagingSenderId: '929689339419',
    projectId: 'alaman-2d492',
    
    // databaseURL:
    //     'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
   
    storageBucket: 'alaman-2d492.appspot.com',


  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKVt_a7q4T_Qk0ABc3C9Lxn-HAq4CA99Q',//done
    appId: '1:929689339419:ios:8e32fe12e198c046001abe',//done
    messagingSenderId: '929689339419',//done
    projectId: 'alaman-2d492',//done
    // databaseURL:
        // 'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alaman-2d492.appspot.com',//done
    androidClientId:
        '929689339419-2d4oqq68n1g5ia94j2alu7rgdrpdj5gv.apps.googleusercontent.com',
    iosClientId:
        '929689339419-jit4u3dnsps8tuv352pc9g9l49mvllqb.apps.googleusercontent.com',
    iosBundleId: 'com.Alaman.hrapp',
  );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c',
  //   appId: '1:406099696497:ios:1b423b89c63b82053574d0',
  //   messagingSenderId: '406099696497',
  //   projectId: 'flutterfire-e2e-tests',
  //   databaseURL:
  //       'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
  //   storageBucket: 'alaman-2d492.appspot.com',
  //   androidClientId:
  //       '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
  //   iosClientId:
  //       '406099696497-irb7edfevfkhi6t5s9kbuq1mt1og95rg.apps.googleusercontent.com',
  //   iosBundleId: 'io.flutter.plugins.firebase.messaging',
  // );
}