import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timetutor/models/exam.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'dart:io';
import 'package:timetutor/models/models.dart';

enum YamlDataType {
  update,
  install,
  exam,
}

class ParsedYamlData {
  int version;
  YamlDataType type;
  String? description;
  UserInstitution? institution;
  CurrentSettings? settings;
  UserTimetable? timetable;
  Exam? exam;

  ParsedYamlData({
    required this.type,
    required this.version,
    this.institution,
    this.settings,
    this.timetable,
    this.exam,
  });
}

class Utils {
  static const hoursPattern = r"1[0-2]|0?[1-9]";
  static const minutesPattern = r"[0-5][0-9]";
  static const timePattern =
      "^(((?<h1>$hoursPattern)(:(?<m1>$minutesPattern))?(?<a1>[AaPp][Mm])?)-((?<h2>$hoursPattern)(:(?<m2>$minutesPattern))?(?<a2>[AaPp][Mm])?))";

  static final timePatternReg = RegExp(timePattern);

  static double timeOfDayAsDouble(TimeOfDay tod) {
    return tod.hour + tod.minute / 60.0;
  }

  static TimeOfDay dateTimeAsTimeOfDay(DateTime dt) {
    return TimeOfDay(hour: dt.hour, minute: dt.minute);
  }

  static double percentage(TimeOfDay timeOfDay, TimeOfDay from, TimeOfDay to) {
    return (Timing.timeOfDayAsDouble(timeOfDay) -
            Timing.timeOfDayAsDouble(from)) /
        (Timing.timeOfDayAsDouble(to) - Timing.timeOfDayAsDouble(from));
  }

  static void sortPeriods(List<Period> periods) {
    periods.sort((a, b) => Timing.timeOfDayAsDouble(
            Utils.dateTimeAsTimeOfDay(a.timing.from))
        .compareTo(
            Timing.timeOfDayAsDouble(Utils.dateTimeAsTimeOfDay(b.timing.to))));
  }

  static DateTime timeOfDayToDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  }

  static Future<Uint8List> getFileDataFromContentUri(String uri) async {
    File file = await toFile(uri);
    return file.readAsBytes();
  }

  static String timeStringToDefaultTimeString(String string) {
    final match = timePatternReg.firstMatch(string);

    if (match == null) {
      throw Exception("Wtf is $string");
    }

    final h1 = match.namedGroup("h1");
    final m1 = match.namedGroup("m1") ?? "00";

    final h2 = match.namedGroup("h2");
    final m2 = match.namedGroup("m2") ?? "00";

    final ma1 = match.namedGroup("a1");
    final ma2 = match.namedGroup("a2");

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

    return "$h1:$m1 $a1-$h2:$m2 $a2";
  }

  static ParsedYamlData parseYamlData(Map<String, dynamic> yaml) {
    final version = yaml["version"] as int;
    final type = YamlDataType.values.byName(yaml["type"] as String);

    UserTimetable? timetable;
    if (yaml["timetable"] != null) {
      timetable = UserTimetable.fromJson(yaml["timetable"]);
    }

    Exam? exam;
    if (yaml["exam"] != null) {
      exam = Exam(); // TODO: implement exam parsing
    }

    if (type == YamlDataType.update) {
      return ParsedYamlData(version: version, type: type, timetable: timetable);
    } else if (type == YamlDataType.install) {
      return ParsedYamlData(
          version: version, type: type, timetable: timetable!);
    } else if (type == YamlDataType.exam) {
      return ParsedYamlData(version: version, type: type, exam: exam);
    } else {
      throw Exception("failed");
    }
  }
}
