import 'dart:convert';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'impls/impls.dart';
import 'impls/utils.dart';
import 'impls/timetable.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pages/main_settings.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tutor',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          iconTheme: const IconThemeData(color: Colors.purple),
          toggleButtonsTheme: const ToggleButtonsThemeData(),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          backgroundColor: Colors.black),
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
  LocalStorage timetableJson = LocalStorage("timetable.json");
  Timetable timetable = Timetable.blank();
  MainSettings settings = MainSettings();

  late StreamSubscription _intentDataStreamSubscription;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      setState(() {
        if (Uri.tryParse(value) != null) {
          installTimetableFromContentUri(value);
        }
      });
    }, onError: (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("What was that")));
    });

    ReceiveSharingIntent.getInitialText().then((String? value) {
      setState(() {
        if (value != null && Uri.tryParse(value) != null) {
          installTimetableFromContentUri(value);
        }
      });
    });

    timetableJson.ready.then((_) {
      if (timetableJson.getItem("timetable") == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Hey, seems like you don't have any timetable installed")));
      } else {
        timetable = Timetable.fromJson(timetableJson.getItem("timetable"));
      }
    });

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  void installTimetableFromContentUri(String uri) {
    Utils.getFileDataFromContentUri(uri).then((source) {
      try {
        Map<String, dynamic> json = jsonDecode(String.fromCharCodes(source));
        timetable = Timetable.fromJson(json);
      } catch (jsonError) {
        try {
          timetable = Timetable.fromText(String.fromCharCodes(source));
        } catch (textError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Error parsing text: ${textError.toString()}")),
          );
          return;
        }
      }

      timetableJson.ready.then((value) {
        timetableJson
            .setItem("timetable", timetable.toJson())
            .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Timetable installed")),
                ))
            .onError((error, stackTrace) =>
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Error while saving")),
                ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    TimeOfDay tod = TimeOfDay(hour: now.hour, minute: now.minute);

    List<Period> periods = timetable.returnDayPeriods(now.weekday);
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
        appBarColor: Colors.black,
        backgroundColor: Colors.black,
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
        headerWidget: Center(
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
                  percent: Utils.percentage(
                      tod, currentPeriod.timing.from, currentPeriod.timing.to),
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
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                ],
              )
            ],
          ),
        ),
        fullyStretchable: true,
        expandedBody: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Day(timetable.sunday, "Sunday"),
                Day(timetable.monday, "Monday"),
                Day(timetable.tuesday, "Tuesday"),
                Day(timetable.wednesday, "Wednesday"),
                Day(timetable.thursday, "Thursday"),
                Day(timetable.friday, "Friday"),
                Day(timetable.saturday, "Saturday"),
              ].where((day) => day.periods.isNotEmpty).map((day) {
                return Column(
                  children: [
                    Text(
                      day.name,
                      style: TextStyle(color: Colors.white70),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 100,
                        aspectRatio: 1,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: settings.autoPlayPeriodsAnimation,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: List.generate(day.periods.length, (index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: 100,
                              child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(
                                    children: [
                                      Text(
                                        "#${index + 1}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color),
                                      ),
                                      Text(
                                        day.periods[index].subject.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white70),
                                      ),
                                      Text(
                                        day.periods[index].timing.toString(),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color),
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
            )
          ],
        ),
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
            ],
          )
        ]);
  }
}
