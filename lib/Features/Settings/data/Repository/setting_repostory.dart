// add all notification headers function needy in our app needed to be consumed
abstract class SettingPageRepostory {
  Future<void> salaAlaaElnapyNotification();

  Future<void> morningAzkarNotification();
  // schecudled notification
  //

  Future<void> eveningAzkarNotification();

  Future<void> walkingUpNotification();
  Future<void> azkarBeforeSleeping();
}
