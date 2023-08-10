import 'package:flutter/material.dart';
import 'package:notification_flutter/services/firebase_notification_Services.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    
    notificationServices.firebaseInit(context);
  
    notificationServices.getDeviceToken().then((value) {
      print('device token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
