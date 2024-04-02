import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../notification_services.dart';
import 'setting_repostory.dart';

class SettingPageRepoImplementation extends SettingPageRepostory {
  // ignore: unused_field
  final LocalNotificationServices _localNotificationServices =
      LocalNotificationServices.getInstance();

  @override
  Future<void> azkarBeforeSleeping() async {
    _localNotificationServices.showSimpleMessage(
      id: 1,
      title: 'hi',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails('1', 'lnn'),
      ),
      body: '3amaltha ?',
    );
  }

  @override
  eveningAzkarNotification() async {}

  @override
  morningAzkarNotification() async {}

  @override
  salaAlaaElnapyNotification() async {}

  @override
  walkingUpNotification() async {}
}
