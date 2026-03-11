import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mcr/core/localization/localization_methods.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  /// تهيئة الإشعارات
  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@drawable/notification_icon');
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // تهيئة الإشعارات
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // طلب إذن الإشعارات (Android 13+)
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // تهيئة timezone
    tz.initializeTimeZones();

    String timeZoneName = 'Africa/Cairo'; // fallback

    try {
      timeZoneName = await tz.local.name;
    } catch (_) {
      timeZoneName = 'Africa/Cairo';
    }

    tz.setLocalLocation(tz.getLocation(timeZoneName));
    log('TimeZone set to: $timeZoneName');
  }

  /// جدولة إشعارات الأدوية
  /// [hoursInterval] كل كم ساعة
  /// [durationDays] مدة العلاج بالأيام
  static Future<void> scheduleMedicineNotifications({
    required String medicineName,
    required int hoursInterval,
    required int durationDays,
    required BuildContext context,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'medicine_channel',
      'Medicine Reminder',
      channelDescription: 'Reminder to take medicine',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: 'notification_icon',
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledTime = now;

    int totalNotifications = (24 ~/ hoursInterval) * durationDays;

    for (int i = 1; i <= totalNotifications; i++) {
      scheduledTime = scheduledTime.add(Duration(seconds: hoursInterval));
      int notificationId = medicineName.hashCode + i;
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        medicineName,
        tr(context, "timeToTakeYourMedicine"),
        scheduledTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

      );
    }
  }

 Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}