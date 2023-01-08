import 'impls.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shlex/shlex.dart' as shlex;

class InvalidTimeRangeException implements Exception {
  final String message;

  InvalidTimeRangeException(this.message);

  @override
  String toString() => message;
}

class InvalidDayException implements Exception {
  final String message;

  InvalidDayException(this.message);

  @override
  String toString() => message;
}

class InvalidSubjectException implements Exception {
  final String message;

  InvalidSubjectException(this.message);

  @override
  String toString() => message;
}

class TimetableFromJsonException implements Exception {
  final String message;

  TimetableFromJsonException(this.message);

  @override
  String toString() => message;
}

@JsonSerializable()
class Timetable {
  List<Period> sunday;
  List<Period> monday;
  List<Period> tuesday;
  List<Period> wednesday;
  List<Period> thursday;
  List<Period> friday;
  List<Period> saturday;

  Timetable({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        sunday:
            (json["sunday"] as List).map((e) => Period.fromJson(e)).toList(),
        monday:
            (json["monday"] as List).map((e) => Period.fromJson(e)).toList(),
        tuesday:
            (json["tuesday"] as List).map((e) => Period.fromJson(e)).toList(),
        wednesday:
            (json["wednesday"] as List).map((e) => Period.fromJson(e)).toList(),
        thursday:
            (json["thursday"] as List).map((e) => Period.fromJson(e)).toList(),
        friday:
            (json["friday"] as List).map((e) => Period.fromJson(e)).toList(),
        saturday:
            (json["saturday"] as List).map((e) => Period.fromJson(e)).toList(),
      );

  factory Timetable.blank() => Timetable(
        sunday: [],
        monday: [],
        tuesday: [],
        wednesday: [],
        thursday: [],
        friday: [],
        saturday: [],
      );

  Map<String, dynamic> toJson() => {
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

  static Map<String, List<Map<String, Map<String, String>>>> textToJson(
      String text) {
    const hoursPattern = r"1[0-2]|0?[1-9]";
    const minutesPattern = r"[0-5][0-9]";

    final timePattern = RegExp(
        "^(((?<h1>$hoursPattern)(:(?<m1>$minutesPattern))?(?<a1>[AaPp][Mm])?)-((?<h2>$hoursPattern)(:(?<m2>$minutesPattern))?(?<a2>[AaPp][Mm])?))");

    final dayPattern = RegExp(
        r"sunday|monday|tuesday|wednesday|thursday|friday|saturday",
        caseSensitive: false);

    final firstLine = text.trim().split('\n').first;
    final cols = text
        .trim()
        .split('\n')
        .skip(1)
        .where((r) => r.trim().isNotEmpty)
        .toList();

    List<String> timeStrings = firstLine
        .split(" ")
        .map((e) => e.trim())
        .where((e) => e != "")
        .toList();

    List<String> newTimeStrings = [];

    for (String string in timeStrings) {
      final match = timePattern.firstMatch(string);

      if (match == null) {
        throw InvalidTimeRangeException("Wtf is $string");
      }

      var h1 = match.namedGroup("h1");
      var m1 = match.namedGroup("m1") ?? "00";

      var h2 = match.namedGroup("h2");
      var m2 = match.namedGroup("m2") ?? "00";

      var ma1 = match.namedGroup("a1");
      var ma2 = match.namedGroup("a2");

      late String a1;
      late String a2;

      if (ma1 == null && ma2 == null) {
        a1 = a2 = "AM"; // default
      } else {
        a1 = (ma1 ?? ma2)!;
        a2 = (ma2 ?? ma1)!;
      }

      a1 = a1.toUpperCase();
      a2 = a2.toUpperCase();

      newTimeStrings.add("$h1:$m1 $a1-$h2:$m2 $a2");
    }

    Map<String, List<Map<String, Map<String, String>>>> timetableJson = {
      "sunday": [],
      "monday": [],
      "tuesday": [],
      "wednesday": [],
      "thursday": [],
      "friday": [],
      "saturday": [],
    };
    for (var col in cols) {
      col = col.trim();
      var day = col.split(" ")[0];
      List<String> subs = shlex.split(col.substring(day.length));

      if (!dayPattern.hasMatch(day)) {
        throw Exception("Invalid day $day");
      }

      day = day.toLowerCase();

      List<Map<String, Map<String, String>>> periods = [];
      late String string;
      for (var i = 0; i < subs.length; i++) {
        var sub = subs[i].trim();
        if (sub == "~none") {
          // command to skip
          continue;
        } else if (sub == "~prev") {
          // combines previous period to the current
          if (i == 0) {
            throw InvalidSubjectException("$sub cannot be the first preiod");
          }
          var prev = periods.removeLast();
          String prevTiming = prev["timing"]!["string"]!;
          string =
              '${prevTiming.split("-")[0]}-${newTimeStrings[i].split("-")[1]}';
          sub = prev["subject"]!["name"]!;
        } else {
          string = newTimeStrings[i];
        }

        periods.add({
          "timing": {"string": string},
          "subject": {"name": sub}
        });
      }

      timetableJson[day] = periods;
    }

    return timetableJson;
  }

  factory Timetable.fromText(String text) {
    return Timetable.fromJson(Timetable.textToJson(text));
  }
}
