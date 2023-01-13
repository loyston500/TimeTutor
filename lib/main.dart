import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:timetutor/impls/impls.dart';
import 'package:timetutor/impls/utils.dart';
import 'package:timetutor/impls/timetable.dart';
import 'package:timetutor/themes/themes.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:timetutor/pages/main_settings.dart';
import 'package:localstorage/localstorage.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  MainSettings settings = MainSettings();
  ThemeData lightTheme = Themes.light;
  ThemeData darkTheme = Themes.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tutor',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        title: 'Time Tutor',
        root: root,
      ),
    );
  }

  void setDarkTheme(ThemeData themeData) {
    setState(() {
      darkTheme = themeData;
    });
  }

  void setLightTheme(ThemeData themeData) {
    setState(() {
      lightTheme = themeData;
    });
  }

  void refresh() => setState(() {});

  AppState root() {
    return this;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.root});

  final String title;
  final AppState Function() root;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeMode themeMode = ThemeMode.dark;
  LocalStorage timetableJson = LocalStorage("timetable.json");
  Timetable timetable = Timetable.blank();

  late StreamSubscription _intentDataStreamSubscription;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    /*SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
    );*/

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

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
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

    late int currentPeriodPos;

    for (currentPeriodPos = 0;
        currentPeriodPos < periods.length;
        currentPeriodPos++) {
      var period = periods[currentPeriodPos];
      double percent =
          Utils.percentage(tod, period.timing.from, period.timing.to);
      if (percent > 1) {
        prevPeriod = period;
      } else if (percent >= 0 && percent <= 1) {
        currentPeriod = period;
        if (period != periods.last) {
          nextPeriod = periods[currentPeriodPos + 1];
        }
        if (period != periods.first) {
          prevPeriod = periods[currentPeriodPos - 1];
        }
        break;
      } else {
        nextPeriod = period;
        if (period != periods.first) {
          prevPeriod = periods[currentPeriodPos - 1];
        }
        break;
      }
    }

    return DraggableHome(
      appBarColor: Theme.of(context).backgroundColor,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        currentPeriod != null ? currentPeriod.subject.name : "You're Free",
        style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainSettingsPage(
                    settings: widget.root().settings,
                    root: widget.root,
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
            if (currentPeriod != null)
              Text("${currentPeriodPos + 1}/${periods.length}"),
            SizedBox(
              width: 350,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                    currentPeriod != null
                        ? currentPeriod.subject.name
                        : "You're Free",
                    style: Theme.of(context).textTheme.headline2!),
              ),
            ),
            Text(
              currentPeriod != null
                  ? currentPeriod.timing.toString()
                  : "Yup, you heard it right",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
            const SizedBox(height: 10),
            if (currentPeriod != null)
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                progressColor: Theme.of(context).primaryColor,
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
                  )
                else if (currentPeriod == periods.last)
                  const Text(
                    "This is your last period for today!",
                  )
                else if (nextPeriod != null)
                  Text(
                    "${nextPeriod.subject.name}"
                    " ${Jiffy(Utils.timeOfDayToDateTime(now, nextPeriod.timing.from)).from(now)}",
                  )
                else
                  const Text(
                    "No more periods for today!",
                  ),
                const SizedBox(height: 10),
                if (widget.root().settings.displayPrevPeriod &&
                    prevPeriod != null)
                  Text(
                    "${prevPeriod.subject.name} was ${Jiffy(Utils.timeOfDayToDateTime(now, prevPeriod.timing.to)).from(now)}",
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            )
          ],
        ),
      ),
      fullyStretchable: true,
      expandedBody: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                DayProperties(DateTime.sunday, "Sunday"),
                DayProperties(DateTime.monday, "Monday"),
                DayProperties(DateTime.tuesday, "Tuesday"),
                DayProperties(DateTime.wednesday, "Wednesday"),
                DayProperties(DateTime.thursday, "Thursday"),
                DayProperties(DateTime.friday, "Friday"),
                DayProperties(DateTime.saturday, "Saturday"),
              ]
                  .where((dayProperty) =>
                      timetable.returnDayPeriods(dayProperty.day).isNotEmpty)
                  .map((dayProperty) {
                final periods = timetable.returnDayPeriods(dayProperty.day);
                return Column(
                  children: [
                    Text(
                      dayProperty.name,
                      style: TextStyle(
                          color: dayProperty.day == now.weekday
                              ? Theme.of(context).primaryColor
                              : null),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 90,
                        aspectRatio: 1,
                        viewportFraction: 0.35,
                        initialPage: dayProperty.day == now.weekday &&
                                currentPeriod != null
                            ? currentPeriodPos
                            : 0,
                        enableInfiniteScroll: widget
                            .root()
                            .settings
                            .timetableEnableInfiniteScroll,
                        autoPlay: widget
                            .root()
                            .settings
                            .timetableAutoPlayPeriodsAnimation,
                        autoPlayInterval: Duration(
                            seconds: widget
                                .root()
                                .settings
                                .timetableAutoPlayInterval),
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
                                        style: (dayProperty.day ==
                                                    now.weekday &&
                                                currentPeriod != null &&
                                                index == currentPeriodPos)
                                            ? Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    shadows: [
                                                    Shadow(
                                                      color: Theme.of(context)
                                                          .primaryColor,
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
      ),
      body: [
        Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text("Today's tasks",
                      style: Theme.of(context).textTheme.headlineSmall!),
                )),
          ],
        )
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
