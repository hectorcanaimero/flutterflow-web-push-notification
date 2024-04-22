// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future createSw() async {
  // Get the path to the web folder
  Directory webDirectory = await getApplicationDocumentsDirectory();
  String webPath = webDirectory.path;

  // Verificar si el archivo ya existe en la carpeta web
  String filePath = '$webPath/firebase-messaging-sw.js';
  if (await File(filePath).exists()) {
    print('El archivo ya existe en la carpeta web.');
    return;
  }
  try {
    // Leer el contenido del archivo desde los recursos (assets)
    String content = """
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

    // Escribir el archivo en la carpeta web
    await File(filePath).writeAsString(content);
    print('Archivo copiado a la carpeta web.');
  } catch (e) {
    print('Error al copiar el archivo: $e');
  }
  print('firebase-messaging-sw.js created successfully!');
}
