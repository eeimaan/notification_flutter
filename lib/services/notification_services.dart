import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
class NotificationManager {
  
  //Create an instance of FlutterLocalNotificationsPlugin:
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
 
 //Define a function called initNotification for initializing local notifications:
  Future<void> initNotification() async {

//This sets up the initialization settings for Android. The parameter 'flutter_logo' refers to
//the name of a drawable resource in the Android app's resources. 
//It is used as the default icon for notifications.
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');
//This sets up the initialization settings for iOS. The parameters requestAlertPermission, requestBadgePermission, and 
//requestSoundPermission are boolean flags that specify whether the app should request permission 
    DarwinInitializationSettings initializationIos =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
// onDidReceiveLocalNotification callback is provided,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
//This creates an InitializationSettings object by combining the Android and iOS settings.
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationIos);
    await notificationsPlugin.initialize(
      initializationSettings,
//The onDidReceiveNotificationResponse callback is also provided, which can be used to handle 
// user interactions with notifications, but it currently doesn't have any implementation.
      onDidReceiveNotificationResponse: (details) {},
    );
  }
//Define a function called simpleNotificationShow:
//This sets up the Android-specific details for the notification. The AndroidNotificationDetails class allows you 
//to define various properties for the notification, such as the channel ID, channel title, priority, importance, icon, and more. In this case:
//'Channel_id' is the ID of the notification channel.
//'Channel_title' is the title of the notification channel.
//Priority.high sets the notification's priority to high.
//Importance.max sets the notification's importance to the highest level.
//'flutter_logo' is the name of the drawable resource used as the notification icon.
//channelShowBadge is set to true, indicating that the channel should display badges.
//largeIcon is set to DrawableResourceAndroidBitmap('flutter_logo'), providing a larger version of the notification icon.
  Future<void> simpleNotificationShow() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
        //Priority refers to the level of interruption a notification can cause to the user's current activity. It determines how aggressively the notification should be brought to the user's attention.
//Importance determines the overall significance of a notification and its ability to override user settings like "Do Not Disturb" mode.
            priority: Priority.high,
            importance: Importance.max,
            icon: 'flutter_logo',
            channelShowBadge: true,
            largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));
//The NotificationDetails class is used to combine the platform-specific notification details. In this case,
// it includes only the Android-specific details that were defined earlier.
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
        //Display the notification:
    await notificationsPlugin.show(
        0, 'Simple Notification', 'New User send message', notificationDetails);
  }

  Future<void> bigPictureNotificationShow() async {
    BigPictureStyleInformation bigPictureStyleInformation =
        const BigPictureStyleInformation(
            DrawableResourceAndroidBitmap('flutter_logo'),
            contentTitle: 'Code Compilee',
            largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('big_picture_id', 'big_picture_title',
            priority: Priority.high,
            importance: Importance.max,
            styleInformation: bigPictureStyleInformation);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(
        1, 'Big Picture Notification', 'New Message', notificationDetails);
  }

  Future<void> multipleNotificationShow() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
            priority: Priority.high,
            importance: Importance.max,
            groupKey: 'commonMessage');

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    notificationsPlugin.show(
        0, 'New Notification', 'User 1 send message', notificationDetails);

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        notificationsPlugin.show(
            1, 'New Notification', 'User 2 send message', notificationDetails);
      },
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        notificationsPlugin.show(
            2, 'New Notification', 'User 3 send message', notificationDetails);
      },
    );

    List<String> lines = ['user1', 'user2', 'user3'];
//In summary, the InboxStyleInformation allows you to create a visually appealing summary for a group of notifications, showing the content of each individual
// notification in an expanded view while providing a concise summary in the collapsed view.
    InboxStyleInformation inboxStyleInformation =
        InboxStyleInformation(lines, contentTitle: '${lines.length} messages',summaryText: 'Code Compilee');

   AndroidNotificationDetails androidNotificationSpesific=AndroidNotificationDetails(
    'groupChennelId',
    'groupChennelTitle',
    styleInformation: inboxStyleInformation,
    groupKey: 'commonMessage',
    setAsGroupSummary: true
   );     
   NotificationDetails platformChannelSpe=NotificationDetails(android: androidNotificationSpesific);
  await notificationsPlugin.show(3, 'Attention', '${lines.length} messages', platformChannelSpe);
  }
  
  Future<void> scheduleNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    final scheduledTime =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    await notificationsPlugin.zonedSchedule(
      0,
      'scheduled title',
      'scheduled body',
      scheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
   



}
