// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future createSw() async {
  String jsCode = """
    importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
    importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

    const firebaseConfig = {
      apiKey: "AIzaSyDFhk6-PfrZ1H6xOz-JSCrvf_4lRjaxTJM",
      authDomain: "mario-test-oy5suz.firebaseapp.com",
      projectId: "mario-test-oy5suz",
      storageBucket: "mario-test-oy5suz.appspot.com",
      messagingSenderId: "439067069464",
      appId: "1:439067069464:web:cfe178e5d7d4732731876d"
    };

    firebase.initializeApp(firebaseConfig);

    const messaging = firebase.messaging();

    // Optional:
    messaging.onBackgroundMessage((message) => {
      console.log("onBackgroundMessage", message);
    });
  """;

  // Ruta donde se guardará el archivo JavaScript
  String jsFilePath = 'web/firebase-messaging-sw.js';

  // Crear el archivo JavaScript
  File(jsFilePath).writeAsStringSync(jsCode);

  print('Archivo JavaScript creado en $jsFilePath');
}
