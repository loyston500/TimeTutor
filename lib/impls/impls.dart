import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class Day {
  List<Period> periods;
  String name;

  Day(this.periods, this.name);
}

@JsonSerializable()
class Subject {
  String name;

  Subject(this.name);

  factory Subject.fromJson(Map<String, dynamic> json) =>
      Subject(json["name"] as String);

  Map<String, dynamic> toJson() => {"name": name};

  @override
  bool operator ==(Object other) {
    return other is Subject && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

@JsonSerializable()
class Timing {
  TimeOfDay from;
  TimeOfDay to;

  Timing(this.from, this.to);

  String format(BuildContext context) {
    return "${from.format(context)}-${to.format(context)}";
  }

  @override
  String toString() {
    String formatTimeOfDay(TimeOfDay tod) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
      final format = DateFormat.jm();
      return format.format(dt);
    }

    return "${formatTimeOfDay(from)}-${formatTimeOfDay(to)}";
  }

  static double timeOfDayAsDouble(TimeOfDay tod) {
    return tod.hour + tod.minute / 60.0;
  }

  factory Timing.fromString(String string) {
    var fromString = string.split("-")[0];
    var toString = string.split("-")[1];
    return Timing(
        TimeOfDay.fromDateTime(DateFormat("hh:mm a").parse(fromString)),
        TimeOfDay.fromDateTime(DateFormat("hh:mm a").parse(toString)));
  }

  factory Timing.fromJson(Map<String, dynamic> json) =>
      Timing.fromString(json["string"] as String);

  Map<String, dynamic> toJson() => {"string": toString()};

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

@JsonSerializable()
class Period {
  Subject subject;
  Timing timing;

  Period(this.subject, this.timing);

  factory Period.fromJson(Map<String, dynamic> json) => Period(
      Subject.fromJson(json["subject"]), Timing.fromJson(json["timing"]));

  Map<String, dynamic> toJson() =>
      {"subject": subject.toJson(), "timing": timing.toJson()};

  @override
  bool operator ==(Object other) {
    return other is Period &&
        other.subject == subject &&
        other.timing == timing;
  }

  @override
  int get hashCode => Object.hash(subject, timing);
}
