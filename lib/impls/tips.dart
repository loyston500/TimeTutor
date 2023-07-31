import 'package:jiffy/jiffy.dart';
import 'package:timetutor/models/models.dart';
import 'package:timetutor/models/holiday.dart';

class Tip {
  String? msg;

  Tip(this.msg);

  static Tip? generateTip({
    required Timetable timetable,
    required List<Task> tasks,
    required List<Holiday> holidays,
    required DateTime now,
  }) {
    return null;
  }
}
