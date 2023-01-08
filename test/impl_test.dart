import 'package:timetutor/impls/impls.dart';
import 'package:timetutor/impls/timetable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

void main() {
  test('Subjects with same name should be considered same', () {
    var sub1 = Subject("English");
    var sub2 = Subject("English");
    var sub3 = Subject("Math");

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

    timings.sort((a, b) => Timing.timeOfDayAsDouble(a.from)
        .compareTo(Timing.timeOfDayAsDouble(b.from)));

    expect(listEquals(timings, preSorted), true);
  });

  test('Timetable text to json validity', (() {
    const text = """
        9-10AM           10-11AM    11AM-12PM

Monday  "C programming"  ~prev
Tuesday Python           ~prev      ~prev

""";

    final Map<String, List<Map<String, Map<String, String>>>> json =
        Timetable.textToJson(text);

    expect(json, {
      "sunday": [],
      "monday": [
        {
          "subject": {"name": "C programming"},
          "timing": {"string": "9:00 AM-11:00 AM"}
        }
      ],
      'tuesday': [
        {
          "subject": {"name": "Python"},
          "timing": {"string": "9:00 AM-12:00 PM"}
        }
      ],
      'wednesday': [],
      'thursday': [],
      'friday': [],
      'saturday': [],
    });
  }));
}
