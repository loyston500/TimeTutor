import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'impls/impls.dart';
import 'impls/utils.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'pages/main_settings.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tutor',
      theme: FlexThemeData.light(
        scheme: FlexScheme.mandyRed,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.mandyRed,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
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
  LocalStorage timeTableJson = LocalStorage("timetable.json");
  TimeTable timeTable = TimeTable.blank();
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
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Timetable installed")));
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
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Timetable installed")));
        }
      });
    });

    timeTableJson.ready.then((_) {
      if (timeTableJson.getItem("timetable") == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Hey, seems like you don't have any timetable installed")));
      } else {
        timeTable = TimeTable.fromJson(timeTableJson.getItem("timetable"));
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

  void installTimetableFromContentUri(String uri) async {
    String source =
        String.fromCharCodes(await Utils.getFileDataFromContentUri(uri));
    Map<String, dynamic> json = jsonDecode(source);
    timeTable = TimeTable.fromJson(json);
    timeTableJson.ready.then(
        (value) => timeTableJson.setItem("timetable", timeTable.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    TimeOfDay tod = TimeOfDay(hour: now.hour, minute: now.minute);

    List<Period> periods = timeTable.returnDayPeriods(now.weekday);
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
