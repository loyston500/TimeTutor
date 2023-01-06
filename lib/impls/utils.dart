import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'dart:io';
import 'impls.dart';

class Utils {
  static double timeOfDayAsDouble(TimeOfDay tod) {
    return tod.hour + tod.minute / 60.0;
  }

  static double percentage(TimeOfDay timeOfDay, TimeOfDay from, TimeOfDay to) {
    return (Timing.timeOfDayAsDouble(timeOfDay) -
            Timing.timeOfDayAsDouble(from)) /
        (Timing.timeOfDayAsDouble(to) - Timing.timeOfDayAsDouble(from));
  }

  static void sortPeriods(List<Period> periods) {
    periods.sort((a, b) => Timing.timeOfDayAsDouble(a.timing.from)
        .compareTo(Timing.timeOfDayAsDouble(b.timing.from)));
  }

  static DateTime timeOfDayToDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  }

  static Future<Uint8List> getFileDataFromContentUri(String uri) async {
    File file = await toFile(uri);
    return file.readAsBytes();
  }
}
