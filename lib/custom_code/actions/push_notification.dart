// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:firebase_core/firebase_core.dart';

Future pushNotification() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDFhk6-PfrZ1H6xOz-JSCrvf_4lRjaxTJM",
        authDomain: "mario-test-oy5suz.firebaseapp.com",
        projectId: "mario-test-oy5suz",
        storageBucket: "mario-test-oy5suz.appspot.com",
        messagingSenderId: "439067069464",
        appId: "1:439067069464:web:cfe178e5d7d4732731876d"),
  );
  // Add your function code here!
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permisos de notificación concedidos');
  } else {
    print('Permisos de notificación denegados');
  }
  // Configurar manejadores de eventos
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Mensaje recibido: ${message.notification?.title}');
    await actions.localNotification(
      message.notification?.title ?? 'Notificación',
      message.notification?.body ?? 'Cuerpo de la notificación',
    );
  });
  String? deviceToken = await FirebaseMessaging.instance.getToken();
  print('TOKEN ${deviceToken}');
}
