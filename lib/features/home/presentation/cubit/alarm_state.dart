import 'package:equatable/equatable.dart';

import '../../data/model/alarm_model.dart';

class AlarmState extends Equatable {
  final List<Alarm> alarms;

  const AlarmState({this.alarms = const []});

  AlarmState copyWith({List<Alarm>? alarms}) {
    return AlarmState(alarms: alarms ?? this.alarms);
  }

  @override
  List<Object> get props => [alarms];
}
