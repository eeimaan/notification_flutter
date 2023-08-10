import 'package:flutter/material.dart';
import 'package:notification_flutter/firebase_notification_Screen.dart';
import 'package:notification_flutter/notification_screen.dart';
import 'package:notification_flutter/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main()async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
  WidgetsFlutterBinding.ensureInitialized();
  NotificationManager().initNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
