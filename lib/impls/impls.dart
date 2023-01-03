import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

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

  factory Period.fromJson(Map<String, dynamic> json) =>
      Period(json["subject"] as Subject, json["timing"] as Timing);

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

@JsonSerializable()
class TimeTable {
  List<Subject> subjects;
  List<Timing> timings;

  List<Period> sunday;
  List<Period> monday;
  List<Period> tuesday;
  List<Period> wednesday;
  List<Period> thursday;
  List<Period> friday;
  List<Period> saturday;

  TimeTable({
    required this.subjects,
    required this.timings,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory TimeTable.fromJson(Map<String, dynamic> json) => TimeTable(
        timings: (json["timings"] as List).map((e) => e as Timing).toList(),
        subjects: (json["subjects"] as List).map((e) => e as Subject).toList(),
        sunday: (json["sunday"] as List).map((e) => e as Period).toList(),
        monday: (json["monday"] as List).map((e) => e as Period).toList(),
        tuesday: (json["tuesday"] as List).map((e) => e as Period).toList(),
        wednesday: (json["wednesday"] as List).map((e) => e as Period).toList(),
        thursday: (json["thursday"] as List).map((e) => e as Period).toList(),
        friday: (json["friday"] as List).map((e) => e as Period).toList(),
        saturday: (json["saturday"] as List).map((e) => e as Period).toList(),
      );

  Map<String, dynamic> toJson() => {
        "subjects": subjects.map((e) => e.toJson()).toList(),
        "timings": timings.map((e) => e.toJson()).toList(),
        "sunday": sunday.map((e) => e.toJson()).toList(),
        "monday": monday.map((e) => e.toJson()).toList(),
        "tuesday": tuesday.map((e) => e.toJson()).toList(),
        "wednesday": wednesday.map((e) => e.toJson()).toList(),
        "thursday": thursday.map((e) => e.toJson()).toList(),
        "friday": friday.map((e) => e.toJson()).toList(),
        "saturday": saturday.map((e) => e.toJson()).toList(),
      };

  List<Period> returnDayPeriods(int day) {
    switch (day) {
      case DateTime.sunday:
        return sunday;
      case DateTime.monday:
        return monday;
      case DateTime.tuesday:
        return tuesday;
      case DateTime.wednesday:
        return wednesday;
      case DateTime.thursday:
        return thursday;
      case DateTime.friday:
        return friday;
      case DateTime.saturday:
        return saturday;
      default:
        throw Exception("Not a valid day");
    }
  }
}

TimeTable timeTableSample() {
  var subjects = [
    Subject("English"),
    Subject("Math"),
    Subject("Language"),
    Subject("O.E"),
    Subject("Yoga"),
    Subject("Health n Awareness"),
    Subject("FOC"),
    Subject("C programming"),
    Subject("Lunch"),
  ];

  var timings = [
    Timing.fromString("9:00 AM-9:55 AM"),
    Timing.fromString("10:00 AM-10:55 AM"),
    Timing.fromString("11:00 AM-11:55 AM"),
    Timing.fromString("12:00 PM-12:55 PM"),
    Timing.fromString("1:00 PM-1:55 PM"),
    Timing.fromString("2:00 PM-2:55 PM"),
    Timing.fromString("3:00 PM-3:55 PM"),
    Timing.fromString("4:00 PM-4:55 PM"),
  ];

  var timeTable = TimeTable(
    subjects: subjects,
    timings: timings,
    // days
    sunday: [],
    monday: [Period(subjects[0], timings[0])],
    tuesday: [
      Period(Subject("English"), Timing.fromString("1:14 PM-2:00 PM")),
      Period(Subject("Math"), Timing.fromString("2:00 PM-3:00 PM")),
    ],
    wednesday: [],
    thursday: [],
    friday: [],
    saturday: [],
  );

  return timeTable;
}
