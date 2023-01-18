import 'package:isar/isar.dart';
import 'package:timetutor/models/models.dart';
import 'package:timetutor/impls/utils.dart';
import 'package:shlex/shlex.dart' as shlex;

part 'timetable.g.dart';

abstract class Timetable {
  int version;
  String? name;
  String? description;

  List<Period> sunday;
  List<Period> monday;
  List<Period> tuesday;
  List<Period> wednesday;
  List<Period> thursday;
  List<Period> friday;
  List<Period> saturday;

  Timetable({
    required this.version,
    this.name,
    this.description,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

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

@collection
class UserTimetable extends Timetable {
  Id id = 0;
  UserTimetable({
    required super.version,
    super.name,
    super.description,
    required super.sunday,
    required super.monday,
    required super.tuesday,
    required super.wednesday,
    required super.thursday,
    required super.friday,
    required super.saturday,
  });

  factory UserTimetable.blank() => UserTimetable(
        version: 0,
        sunday: [],
        monday: [],
        tuesday: [],
        wednesday: [],
        thursday: [],
        friday: [],
        saturday: [],
      );

  factory UserTimetable.fromJson(Map json) {
    final version = json["version"] as int;

    if (json["table"] != null) {
      final timings = (json["table"]["timings"] as String)
          .split(" ")
          .map((e) => e.trim())
          .where((e) => e != "")
          .map((e) => Utils.timeStringToDefaultTimeString(e))
          .toList();

      final sunday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["sunday"] != null
              ? shlex.split(json["table"]["sunday"] as String)
              : []);

      final monday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["monday"] != null
              ? shlex.split(json["table"]["monday"] as String)
              : []);

      final tuesday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["tuesday"] != null
              ? shlex.split(json["table"]["tuesday"] as String)
              : []);

      final wednesday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["wednesday"] != null
              ? shlex.split(json["table"]["wednesday"] as String)
              : []);

      final thursday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["thursday"] != null
              ? shlex.split(json["table"]["thursday"] as String)
              : []);

      final friday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["friday"] != null
              ? shlex.split(json["table"]["friday"] as String)
              : []);

      final saturday = periodsFromTimingStringsAndSubjectStrings(
          timings,
          json["table"]["saturday"] != null
              ? shlex.split(json["table"]["saturday"] as String)
              : []);

      final name = json["name"] as String?;
      final description = json["description"] as String?;

      return UserTimetable(
        version: version,
        name: name,
        description: description,
        sunday: sunday,
        monday: monday,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday,
      );
    }

    throw Exception("no table");
  }

  static List<Period> periodsFromTimingStringsAndSubjectStrings(
      List<String> timings, List<String> subs) {
    List<Period> periods = [];
    late String string;
    for (var i = 0; i < subs.length; i++) {
      var sub = subs[i].trim();
      if (sub == "~none") {
        // command to skip
        continue;
      } else if (sub == "~prev") {
        // combines previous period to the current
        if (i == 0) {
          throw Exception("$sub cannot be the first preiod");
        }
        var prev = periods.removeLast();
        String prevTiming = prev.timing.toString();
        string = '${prevTiming.split("-")[0]}-${timings[i].split("-")[1]}';
        sub = prev.subject.name;
      } else {
        string = timings[i];
      }

      periods.add(Period.create(
          subject: Subject()..name = sub, timing: Timing.fromString(string)));
    }

    return periods;
  }
}
