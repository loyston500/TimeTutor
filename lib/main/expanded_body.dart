import 'package:flutter/material.dart';
import 'package:timetutor/impls/impls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:timetutor/models/models.dart';

Widget expandedBody({
  required Timetable userTimetable,
  required DateTime now,
  required BuildContext context,
  required int currentPeriodPos,
  required Period? currentPeriod,
  required Settings currentSettings,
  required Iterable<Subject> yesterdaySubjects,
  required Iterable<Subject> subjects,
}) {
  var addSubjects =
      Utils.getSubjectDifference(yesterdaySubjects, subjects).toList();
  var removeSubjects =
      Utils.getSubjectDifference(subjects, yesterdaySubjects).toList();
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Column(
          children: Utils.dayProperties.values
              .where((dayProperty) =>
                  userTimetable.returnDayPeriods(dayProperty.day).isNotEmpty)
              .map((dayProperty) {
            final periods = userTimetable.returnDayPeriods(dayProperty.day);
            return Column(
              children: [
                Text(
                  dayProperty.name,
                  style: TextStyle(
                      color: dayProperty.day == now.weekday
                          ? Theme.of(context).toggleButtonsTheme.color!
                          : null),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 90,
                    aspectRatio: 1,
                    viewportFraction: 0.35,
                    initialPage:
                        dayProperty.day == now.weekday && currentPeriod != null
                            ? currentPeriodPos
                            : 0,
                    enableInfiniteScroll:
                        currentSettings.timetableEnableInfiniteScroll,
                    autoPlay: currentSettings.timetableAutoPlayPeriodsAnimation,
                    autoPlayInterval: Duration(
                        seconds: currentSettings.timetableAutoPlayInterval),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: List.generate(periods.length, (index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: 100,
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                children: [
                                  Text(
                                    "${index + 1}/${periods.length}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    periods[index].subject.name,
                                    style: (dayProperty.day == now.weekday &&
                                            currentPeriod != null &&
                                            index == currentPeriodPos)
                                        ? Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .toggleButtonsTheme
                                                    .color,
                                                shadows: [
                                                Shadow(
                                                  color: Theme.of(context)
                                                      .toggleButtonsTheme
                                                      .color!,
                                                  blurRadius: 10,
                                                )
                                              ])
                                        : Theme.of(context)
                                            .textTheme
                                            .headline5!,
                                  ),
                                  Text(
                                    periods[index].timing.toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                    );
                  }),
                )
              ],
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}
