import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotification);

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
  }

  void _handleNotification(RemoteMessage message) {
    String formattedMessage = ''' 
      Title : ${message.notification?.title}
      Body : ${message.notification?.body}
      Data : ${message.data}
      ''';

    print(formattedMessage);
  }


  Future<String ?> getFcmToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  void onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {

    });
  }
}


Future<void> _handleBackgroundNotification(RemoteMessage message) async {

}

