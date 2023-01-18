import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'timing.g.dart';

@embedded
class Timing {
  late DateTime from;
  late DateTime to;

  Timing();

  @override
  String toString() {
    String formatTimeOfDay(DateTime dt) {
      final now = DateTime.now();
      final newDt = DateTime(now.year, now.month, now.day, dt.hour, dt.minute);
      final format = DateFormat.jm();
      return format.format(newDt);
    }

    return "${formatTimeOfDay(from)}-${formatTimeOfDay(to)}";
  }

  static double timeOfDayAsDouble(TimeOfDay tod) {
    return tod.hour + tod.minute / 60.0;
  }

  factory Timing.fromString(String string) {
    final now = DateTime.now();
    final from = DateFormat("hh:mm a").parse(string.split("-")[0]);
    final to = DateFormat("hh:mm a").parse(string.split("-")[1]);
    return Timing()
      ..from = DateTime(now.year, now.month, now.day, from.hour, from.minute)
      ..to = DateTime(now.year, now.month, now.day, to.hour, to.minute);
  }

  @override
  bool operator ==(Object other) {
    return other is Timing &&
        other.from.hour == from.hour &&
        other.from.minute == from.minute &&
        other.to.hour == to.hour &&
        other.to.minute == to.minute;
  }

  @override
  int get hashCode => Object.hash(from.hour, from.minute, to.hour, to.minute);
}
