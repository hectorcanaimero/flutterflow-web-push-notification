// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import '/custom_code/actions/index.dart' as actions;

Future pushNotification() async {
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
  String deviceToken = FirebaseMessaging.instance.getToken();
  print('TOKEN ${deviceToken}');
}
