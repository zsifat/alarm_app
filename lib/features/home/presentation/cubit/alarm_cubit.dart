import 'package:alarm_app/constants/shared_preference_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/alarm_model.dart';
import 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(const AlarmState()){
    loadAlarms();
  }

  Future<void> addAlarm(DateTime alarmTime) async{
    final newAlarm = Alarm(dateTime: alarmTime);
    final updatedAlarms = List<Alarm>.from(state.alarms)..add(newAlarm);
    await saveAlarms(updatedAlarms);
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
    emit(state.copyWith(alarms: updatedAlarms));
  }

  void clearAlarms() {
    emit(state.copyWith(alarms: []));
  }
}
