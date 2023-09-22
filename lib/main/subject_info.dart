import 'package:flutter/material.dart';
import 'package:timetutor/impls/impls.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:timetutor/models/models.dart';

Widget subjectInfo({
  required CurrentSettings currentSettings,
  required BuildContext context,
  required Iterable<Subject> subjects,
  required Iterable<Subject> yesterdaySubjects,
}) {
  var addSubjects =
      Utils.getSubjectDifference(yesterdaySubjects, subjects).toList();
  var removeSubjects =
      Utils.getSubjectDifference(subjects, yesterdaySubjects).toList();
  var combined = addSubjects + removeSubjects;

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text('Subject addition/removal',
                style: Theme.of(context).textTheme.headlineSmall!),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 90,
              aspectRatio: 0.5,
              viewportFraction: 0.35,
              enableInfiniteScroll:
                  currentSettings.timetableEnableInfiniteScroll,
              autoPlay: currentSettings.timetableAutoPlayPeriodsAnimation,
              autoPlayInterval:
                  Duration(seconds: currentSettings.timetableAutoPlayInterval),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0,
              scrollDirection: Axis.horizontal,
            ),
            items: List.generate(combined.length, (index) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: 100,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          children: [
                            Text(
                              combined[index].name,
                              style: (removeSubjects.contains(combined[index]))
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Theme.of(context).errorColor,
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                            ),
                          ],
                        )),
                  );
                },
              );
            }),
          ),
        ],
      ),
    ),
  );
}
