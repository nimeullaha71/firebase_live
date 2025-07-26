import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_live/fcm_service.dart';
import 'package:flutter/cupertino.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FcmService().init();
  print(await FcmService().getFcmToken());
  runApp(const LiveScoreApp());
}