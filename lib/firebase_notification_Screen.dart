import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notification_flutter/services/firebase_notification_Services.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // send notification to  device 
                  notificationServices.getDeviceToken().then((value) async {
                    var data = {
                      'to': value.toString(),
                      'notification': {
                        'title': 'emaan',
                        'body': 'okk done',
                      },
                      'data': {'type': 'msg', 'id': '123456'}
                    };

                    await http.post(
                        Uri.parse('https://fcm.googleapis.com/fcm/send'),
                        body: jsonEncode(data),
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                          'Authorization':
                              'key=AAAAEU5lJuI:APA91bEIiFVYh7poNPQ-19jL5VwiXs4oqWrHQ-y7vZ9SETRyBaE41FNfr_xZcm491GFdpzj2ZM1gwG-T3SbKJXUDnNhTsjVEye82yfNxHkjfCbURlAQmRKcaNMlTtjpnVXZqLSXs6suA'
                        }).then((value) {
                      if (kDebugMode) {
                        print(value.body.toString());
                      }
                    }).onError((error, stackTrace) {
                      if (kDebugMode) {
                        print(error);
                      }
                    });
                  });
                },
                child: Text('Send Notifications')),
           
          ]),
    );
  }
}


