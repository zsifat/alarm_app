import 'dart:convert';

class Alarm {
  final DateTime dateTime;
  final bool enabled;

  Alarm({
    required this.dateTime,
    this.enabled = true,
  });

  Alarm copyWith({DateTime? dateTime, bool? enabled}) {
    return Alarm(
      dateTime: dateTime ?? this.dateTime,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.toIso8601String(),
      'enabled': enabled,
    };
  }

  factory Alarm.fromMap(Map<String, dynamic> map) {
    return Alarm(
      dateTime: DateTime.parse(map['dateTime']),
      enabled: map['enabled'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Alarm.fromJson(String source) => Alarm.fromMap(json.decode(source));
}
