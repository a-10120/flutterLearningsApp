// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'dart:convert';
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, TargetPlatform;

// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;

//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }


//   static FirebaseOptions android = FirebaseOptions(
//     apiKey: decodeFromBase64(AppEnvironment
//         .instance.configData.appDataConfig.apiConfig.googleApiKeyAndroid),
//     appId: '1:1095752225620:android:c16f8af2c4036c82d52ec1',
//     messagingSenderId: '1095752225620',
//     projectId: 'my6-app---push-notification',
//     storageBucket: 'my6-app---push-notification.appspot.com',
//   );

//   static FirebaseOptions ios = FirebaseOptions(
//     apiKey: decodeFromBase64(AppEnvironment
//         .instance.configData.appDataConfig.apiConfig.googleApiKeyIos),
//     appId: '1:1095752225620:ios:734fffd066220554d52ec1',
//     messagingSenderId: '1095752225620',
//     projectId: 'my6-app---push-notification',
//     storageBucket: 'my6-app---push-notification.appspot.com',
//     iosClientId:
//         '1095752225620-hk184n4k1g4vim130ac6qludo6nva7uk.apps.googleusercontent.com',
//     iosBundleId: 'com.g6hospitality.my6',
//   );
// }


// String decodeFromBase64(String key) {
//   final buffer = base64.decode(key);
//   return String.fromCharCodes(buffer);
// }
