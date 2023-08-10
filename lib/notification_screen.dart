import 'package:flutter/material.dart';
import 'package:notification_flutter/firebase_notification_Screen.dart';
import 'package:notification_flutter/services/notification_services.dart';
import 'package:notification_flutter/utilis/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Local Notification",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Notification Buttons',
            style: TextStyle(color: Colors.deepPurple, fontSize: 18),
          ),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                NotificationManager().simpleNotificationShow();
              },
              title: "Simple Notification"),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                NotificationManager().bigPictureNotificationShow();
              },
              title: "Picture Notification"),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                NotificationManager().multipleNotificationShow();
              },
              title: "Multiple Notification"),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                NotificationManager().scheduleNotification();
              },
              title: "Schedule Notification"),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homePage()),
                );
              },
              title: "Goto Firebase Notifi")
        ],
      ),
    );
  }
}
