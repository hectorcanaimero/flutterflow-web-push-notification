// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future createSw() async {
  // Get the path to the web folder
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
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String webDirPath = appDocDir.path + '/web';
  print('webDirPath ' + webDirPath);
  // Check if the web folder exists
  if (!await webDirPath.exists()) {
    await webDirPath.create(recursive: true); // Create it if it doesn't
  }

  // Create the firebase-messaging-sw.js file
  final swFile = File(webDir.path + '/firebase-messaging-sw.js');

  // Write the content to the file
  await swFile.writeAsString(content);

  print('firebase-messaging-sw.js created successfully!');
}
