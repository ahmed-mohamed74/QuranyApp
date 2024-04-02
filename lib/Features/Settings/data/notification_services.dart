import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServices {
  LocalNotificationServices._();

  static LocalNotificationServices? _localNotificationServices;
  // handle lazy singleTon pattern
  factory LocalNotificationServices.getInstance() {
    return _localNotificationServices ?? LocalNotificationServices._();
  }

  // ===========================
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //setup => done
  //basic
  //repeated notification
  //scheduled notification
  // update setting for different platforms (andriod only first )
  static Future<void> init() async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',

      ///andriod:icon
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
      linux: null,
      macOS: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: , // callback with acall back function
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  //called when notification is recieved while app in foreground
  static void onDidReceiveNotificationResponse(NotificationResponse details) {
    //just printing the message that are
    // log(details.id.toString());
    log(details.input!);
    log(details.notificationResponseType.name);
    log(details.payload!);
  }

  Future<void> showSimpleMessage({
    required int id,
    String? payload,
    required String title,
    required NotificationDetails? notificationDetails,
    required String body,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  //
  Future<void> showRepeatedMessage({
    required int id,
    required RepeatInterval repeatInterval,
    String? payload,
    String? title,
    required NotificationDetails notificationDetails,
    String? body,
  }) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title ?? "",
      body ?? "",
      repeatInterval,
      notificationDetails,
      payload: payload,
    );
  }

  // close specifc channel notification

  Future<void> closeSpecifcNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // close all channels
  Future<void> closeAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
