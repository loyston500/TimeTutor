import 'package:timetutor/models/models.dart';
import 'package:timetutor/impls/impls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

void main() {
  test('Subjects with same name should be considered same', () {
    var sub1 = Subject()..name = "English";
    var sub2 = Subject()..name = "English";
    var sub3 = Subject()..name = "Math";

    expect(sub1 == sub2, true);
    expect(sub1 == sub3, false);

    var subs = (<Subject>[sub1, sub2, sub3]).toSet();
    expect(subs.length, 2);
  });

  test('Timing with same timings should be considered same', () {
    var t1 = Timing.fromString("1:10 PM-4:20 PM");
    var t2 = Timing.fromString("1:10 PM-4:20 PM");
    var t3 = Timing.fromString("1:11 PM-4:20 PM");

    expect(t1 == t2, true);
    expect(t1 == t3, false);
  });

  test('Sorting "Timing"', () {
    var preSorted = [
      Timing.fromString("9:00 AM-9:55 AM"),
      Timing.fromString("10:00 AM-10:55 AM"),
      Timing.fromString("11:00 AM-11:55 AM"),
      Timing.fromString("12:00 PM-12:55 PM"),
    ];

    var timings = [
      Timing.fromString("9:00 AM-9:55 AM"),
      Timing.fromString("11:00 AM-11:55 AM"),
      Timing.fromString("10:00 AM-10:55 AM"),
      Timing.fromString("12:00 PM-12:55 PM"),
    ];

    timings.sort((a, b) =>
        Timing.timeOfDayAsDouble(Utils.dateTimeAsTimeOfDay(a.from)).compareTo(
            Timing.timeOfDayAsDouble(Utils.dateTimeAsTimeOfDay(b.from))));

    expect(listEquals(timings, preSorted), true);
  });

  test(
      "Arbitrary time strings should get converted to default string properlly",
      () {
    var func = Utils.timeStringToDefaultTimeString;
    expect(func("9-10PM"), "9:00 PM-10:00 PM");
    expect(func("9PM-10PM"), "9:00 PM-10:00 PM");
    expect(func("9:00-10PM"), "9:00 PM-10:00 PM");
  });
}
