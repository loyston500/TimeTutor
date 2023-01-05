import 'package:flutter/material.dart';
import 'impls/impls.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'pages/main_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tutor',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Time Tutor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var settings = MainSettings();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    TimeOfDay tod = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeTable timeTable = timeTableSample();

    var periods = timeTable.returnDayPeriods(now.weekday);
    Utils.sortPeriods(periods);

    Period? currentPeriod;
    Period? nextPeriod;
    Period? prevPeriod;

    for (int i = 0; i < periods.length; i++) {
      var period = periods[i];
      double percent =
          Utils.percentage(tod, period.timing.from, period.timing.to);
      if (percent > 1) {
        prevPeriod = period;
      } else if (percent >= 0 && percent <= 1) {
        currentPeriod = period;
        if (period != periods.last) {
          nextPeriod = periods[i + 1];
        }
        if (period != periods.first) {
          prevPeriod = periods[i - 1];
        }
        break;
      } else {
        nextPeriod = period;
        if (period != periods.first) {
          prevPeriod = periods[i - 1];
        }
        break;
      }
    }

    return DraggableHome(
        title: Text(
          currentPeriod != null ? currentPeriod.subject.name : "You're Free",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainSettingsPage(
                      settings: settings,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.settings)),
        ],
        //appBarColor: Colors.grey.shade900,
        headerWidget: Container(
            color: Colors.grey.shade900,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        currentPeriod != null
                            ? currentPeriod.subject.name
                            : "You're Free",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white70),
                      ),
                    ),
                  ),
                  Text(
                    currentPeriod != null
                        ? currentPeriod.timing.toString()
                        : "Yup, you heard it right",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  if (currentPeriod != null)
                    LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: 120.0,
                      lineHeight: 3.0,
                      percent: Utils.percentage(tod, currentPeriod.timing.from,
                          currentPeriod.timing.to),
                      animation: false,
                      animationDuration: 1000,
                    ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (periods.isEmpty)
                        const Text(
                          "You don't have any periods for today!",
                          style: TextStyle(color: Colors.white70),
                        )
                      else if (currentPeriod == periods.last)
                        const Text(
                          "This is your last period for today!",
                          style: TextStyle(color: Colors.white70),
                        )
                      else if (nextPeriod != null)
                        Text(
                          "${nextPeriod.subject.name}"
                          " ${Jiffy(Utils.timeOfDayToDateTime(now, nextPeriod.timing.from)).from(now)}",
                          style: const TextStyle(color: Colors.white70),
                        )
                      else
                        const Text(
                          "No more periods for today!",
                          style: TextStyle(color: Colors.white70),
                        ),
                      const SizedBox(height: 10),
                      if (settings.displayPrevPeriod && prevPeriod != null)
                        Text(
                          "${prevPeriod.subject.name} was ${Jiffy(Utils.timeOfDayToDateTime(now, prevPeriod.timing.to)).from(now)}",
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                    ],
                  )
                ],
              ),
            )),
        body: [
          Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Today's tasks",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white70),
                    ),
                  )),
              TextButton(
                  onPressed: (() {}),
                  child: Text("${settings.displayPrevPeriod}")),
            ],
          )
        ]);
  }
}
