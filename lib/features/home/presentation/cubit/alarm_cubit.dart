import 'package:alarm_app/constants/shared_preference_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main.dart';
import '../../data/model/alarm_model.dart';
import 'alarm_state.dart';
import 'package:timezone/timezone.dart' as tz;


class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(const AlarmState()){
    loadAlarms();
  }

  Future<void> addAlarm(DateTime alarmTime) async{
    final newAlarm = Alarm(dateTime: alarmTime);
    final updatedAlarms = List<Alarm>.from(state.alarms)..add(newAlarm);
    await saveAlarms(updatedAlarms);
    await scheduleNotification(updatedAlarms.length - 1, alarmTime);
    emit(state.copyWith(alarms: updatedAlarms));
  }

  Future<void> toggleAlarm(int index, bool enabled) async{
    final updatedAlarms = state.alarms.asMap().entries.map((entry) {
      if (entry.key == index) {
        return entry.value.copyWith(enabled: enabled);
      }
      return entry.value;
    }).toList();
    await saveAlarms(updatedAlarms);
    if (enabled) {
      await scheduleNotification(index, updatedAlarms[index].dateTime);
    } else {
      await cancelNotification(index);
    }
    emit(state.copyWith(alarms: updatedAlarms));
  }

  Future<void> loadAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final alarmStrings = prefs.getStringList(SharedPrefsKeys.alarmsKey) ?? [];
    final alarms = alarmStrings.map((str) => Alarm.fromJson(str)).toList();
    emit(AlarmState(alarms: alarms));
  }

  Future<void> saveAlarms(List<Alarm> alarms) async {
    final prefs = await SharedPreferences.getInstance();
    final alarmStrings = alarms.map((alarm) => alarm.toJson()).toList();
    await prefs.setStringList(SharedPrefsKeys.alarmsKey, alarmStrings);
  }

  Future<void> removeAlarm(int index) async {
    final updatedAlarms = List<Alarm>.from(state.alarms)..removeAt(index);
    await saveAlarms(updatedAlarms);
    await cancelNotification(index);
    emit(state.copyWith(alarms: updatedAlarms));
  }

  void clearAlarms() {
    emit(state.copyWith(alarms: []));
  }

  Future<void> scheduleNotification(int id, DateTime scheduledTime) async {
    print("Original Time: $scheduledTime (${scheduledTime.timeZoneName})");
    if (scheduledTime.isBefore(DateTime.now())) return;
    final bool? granted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (granted != true) {
      return;
    }
    final localTime = scheduledTime.toLocal();
    final tzScheduledDate = tz.TZDateTime.from(localTime, tz.local);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Alarm',
      'Your alarm is ringing!',
      tzScheduledDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Alarms',
          channelDescription: 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );

  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}