import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('img');

  void initializeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Calculates how many days later to give the notification of Laundry Completion
  Duration _calculateRecieve() {
    int presWeekday = tz.TZDateTime.now(tz.local).weekday;
    if (presWeekday > 4 && presWeekday < 7) {
      return const Duration(days: 4);
    } else {
      return const Duration(days: 3);
    }
  }

  /// Short demo of _calculateReceive
  Duration _calculateReceiveDemo(int weekday) {
    int presWeekday = weekday;
    if (presWeekday > 4 && presWeekday < 7) {
      return const Duration(seconds: 10);
    } else {
      return const Duration(seconds: 3);
    }
  }

  //Schedules a notification in the future to be notified when laundry is complete.
  void scheduleNotification() async {
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Laundry is Done!',
        'Your laundry is complete, please collect it before 5:00 PM today!',
        tz.TZDateTime.now(tz.local).add(_calculateRecieve()),
        const NotificationDetails(
          android: AndroidNotificationDetails('0', 'Laundry Completion'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  /// Demo of scheduleNotification
  void scheduleNotificationDemo() async {
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Laundry is Done!',
        'Your laundry is complete, please collect it before 5:00 PM today!',
        tz.TZDateTime.now(tz.local).add(_calculateReceiveDemo(tz.TZDateTime.now(tz.local).weekday)),
        const NotificationDetails(
            android: AndroidNotificationDetails('0', 'Laundry Completion')),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}
