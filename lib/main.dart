import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timetutor/dialogs/task_editor.dart';
import 'package:timetutor/impls/impls.dart';
import 'package:timetutor/main/expanded_body.dart';
import 'package:timetutor/main/subject_info.dart';
import 'package:timetutor/themes/themes.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:timetutor/pages/settings.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:timetutor/db.dart';
import 'package:timetutor/models/models.dart';
import 'package:yaml/yaml.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'chatgpt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Db.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final _settingsStream = isar.currentSettings.watchObject(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tutor',
      theme: currentSettings.customThemeId.isEmpty
          ? Themes.themeFromPrimaryColor(
              Color(currentSettings.themeColor), ThemeMode.light)
          : Themes.themes[currentSettings.customThemeId]!.light,
      darkTheme: currentSettings.customThemeId.isEmpty
          ? Themes.themeFromPrimaryColor(
              Color(currentSettings.themeColor), ThemeMode.dark)
          : Themes.themes[currentSettings.customThemeId]!.dark,
      themeMode: currentSettings.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(
        title: 'Time Tutor',
      ),
    );
  }

  void refreshNavigationBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
    );
  }

  void refresh() => setState(() {});

  @override
  void initState() {
    super.initState();

    _settingsStream.listen((event) {
      refresh();
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userTimetableStream =
      isar.userTimetables.watchObjectLazy(0, fireImmediately: true);
  final _onGoingTasksStream =
      isar.onGoingTasks.watchLazy(fireImmediately: true);

  ThemeMode themeMode = ThemeMode.dark;

  late StreamSubscription _intentDataStreamSubscription;
  late Timer timer;

  String? tipString;

  @override
  void initState() {
    super.initState();

    _onGoingTasksStream.listen((event) {
      setState(() {});
    });

    _userTimetableStream.listen((event) {
      setState(() {});
    });

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

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  void setTip() {
    //final request = ChatCompleteText(messages: [
    //  Map.of({"role": "user", "content": 'Hello!'})
    //], maxToken: 200, model: Gpt4ChatModel());
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  void installTimetableFromContentUri(String uri) {
    Utils.getFileDataFromContentUri(uri).then((source) {
      final string = String.fromCharCodes(source);
      late Map yaml;
      try {
        yaml = loadYaml(string);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bad data e1: ${e.toString()}")));
        return;
      }

      late ParsedYamlData data;

      try {
        data = Utils.parseYamlData(jsonDecode(jsonEncode(yaml)));
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bad data e2: ${e.toString()}")));
        return;
      }

      // TODO: implement more type support
      if (data.type == YamlDataType.install) {
        userTimetable = data.timetable!;
        isar.writeTxn(() async {
          await isar.userTimetables.put(userTimetable);
        }).then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Install success"))));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("This version of file is currently not supported")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    TimeOfDay tod = TimeOfDay(hour: now.hour, minute: now.minute);

    DayProperty currentDayProperty = Utils.dayProperties[now.weekday]!;

    List<Period> periods = userTimetable.returnDayPeriods(now.weekday);
    Utils.sortPeriods(periods);

    List<Period> yesterdayPeriods =
        userTimetable.returnDayPeriods(yesterday.weekday);
    Utils.sortPeriods(yesterdayPeriods);

    // period calculation

    Period? currentPeriod;
    Period? nextPeriod;
    Period? prevPeriod;

    late int currentPeriodPos;

    for (currentPeriodPos = 0;
        currentPeriodPos < periods.length;
        currentPeriodPos++) {
      var period = periods[currentPeriodPos];
      double percent = Utils.percentage(
          tod,
          Utils.dateTimeAsTimeOfDay(period.timing.from),
          Utils.dateTimeAsTimeOfDay(period.timing.to));
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

    // debugPrint(Utils.timetableToStirng(userTimetable));

    // debugPrint(Utils.tasksToString(onGoingTasks));

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
                  builder: (context) => const SettingsPage(),
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
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(shadows: [
                      if (currentSettings.enablePeriodNameShadow)
                        Shadow(
                            color: Theme.of(context).toggleButtonsTheme.color!,
                            blurRadius: 0,
                            offset: const Offset(2.0, 0))
                    ])),
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
                linearGradient: currentSettings.mainBarGradient
                    ? LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).toggleButtonsTheme.color!,
                      ])
                    : null,
                progressColor: !currentSettings.mainBarGradient
                    ? Theme.of(context).toggleButtonsTheme.color
                    : null,
                backgroundColor: Colors.grey.withOpacity(0.3),
                barRadius: const Radius.circular(5),
                width: 120.0,
                lineHeight: 3.0,
                percent: Utils.percentage(
                    tod,
                    Utils.dateTimeAsTimeOfDay(currentPeriod.timing.from),
                    Utils.dateTimeAsTimeOfDay(currentPeriod.timing.to)),
                animation: true,
                animateFromLastPercent: true,
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
                    " ${Jiffy.parseFromDateTime(DateTime(now.year, now.month, now.day, nextPeriod.timing.from.hour, nextPeriod.timing.from.minute)).fromNow()}",
                  )
                else
                  const Text(
                    "No more periods for today!",
                  ),
                const SizedBox(height: 10),
                if (currentSettings.displayPrevPeriod && prevPeriod != null)
                  Text(
                    "${prevPeriod.subject.name} was ${Jiffy.parseFromDateTime(DateTime(now.year, now.month, now.day, prevPeriod.timing.from.hour, prevPeriod.timing.from.minute)).fromNow()}",
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            )
          ],
        ),
      ),
      fullyStretchable: true,
      // code is in another file
      expandedBody: expandedBody(
          userTimetable: userTimetable,
          now: now,
          context: context,
          currentPeriodPos: currentPeriodPos,
          currentPeriod: currentPeriod,
          currentSettings: currentSettings,
          subjects: Utils.getSubjectsFromPeriods(periods),
          yesterdaySubjects: Utils.getSubjectsFromPeriods(yesterdayPeriods)),
      body: [
        Column(
          children: [
            if (periods.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Today\'s periods (${currentDayProperty.shortName})',
                            style: Theme.of(context).textTheme.headlineSmall!),
                      ),
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 90,
                              aspectRatio: 1,
                              viewportFraction: 0.35,
                              initialPage:
                                  currentPeriod != null ? currentPeriodPos : 0,
                              enableInfiniteScroll:
                                  currentSettings.timetableEnableInfiniteScroll,
                              autoPlay: currentSettings
                                  .timetableAutoPlayPeriodsAnimation,
                              autoPlayInterval: Duration(
                                  seconds: currentSettings
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
                                              style: (currentPeriod != null &&
                                                      index == currentPeriodPos)
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .toggleButtonsTheme
                                                              .color,
                                                          shadows: [
                                                          Shadow(
                                                            color: Theme.of(
                                                                    context)
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
                      ),
                    ],
                  ),
                ),
              ),

            /*if (periods.isNotEmpty && yesterdayPeriods.isNotEmpty)
              subjectInfo(
                  currentSettings: currentSettings,
                  context: context,
                  subjects: Utils.getSubjectsFromPeriods(periods),
                  yesterdaySubjects:
                      Utils.getSubjectsFromPeriods(yesterdayPeriods)),*/
            if (chatgpt != null)
              Text("Currently there isn't any tip available"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Today's tasks",
                          style: Theme.of(context).textTheme.headlineSmall!),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var task in onGoingTasks)
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 50,
                                    child: Material(
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        splashColor:
                                            Theme.of(context).primaryColor,
                                        onTapDown: (details) async {
                                          await showMenu<Function>(
                                              context: context,
                                              position: RelativeRect.fromLTRB(
                                                details.globalPosition.dx,
                                                details.globalPosition.dy,
                                                details.globalPosition.dx,
                                                details.globalPosition.dy,
                                              ),
                                              items: [
                                                PopupMenuItem<Function>(
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.edit),
                                                      Text("Edit"),
                                                    ],
                                                  ),
                                                  value: () async {
                                                    await taskEditorDialog(
                                                        context,
                                                        task,
                                                        Utils.setOfAllPeriodsOfTimetable(
                                                                userTimetable)
                                                            .map((e) =>
                                                                e.subject)
                                                            .toSet());
                                                    await isar.writeTxn(
                                                        () async => await isar
                                                            .onGoingTasks
                                                            .put(task));
                                                  },
                                                ),
                                                PopupMenuItem<Function>(
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.delete),
                                                      Text("Delete"),
                                                    ],
                                                  ),
                                                  value: () async =>
                                                      await isar.writeTxn(
                                                          () async => await isar
                                                              .onGoingTasks
                                                              .delete(task.id)),
                                                ),
                                              ]).then((fn) async =>
                                              fn != null ? await fn() : null);
                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            backgroundBlendMode:
                                                BlendMode.overlay,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(task.color ??
                                                Theme.of(context)
                                                    .primaryColorLight
                                                    .value),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 200,
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Text(
                                                  task.title,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      //width: 50,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: Text(
                                                        task.subject != null
                                                            ? task.subject!.name
                                                            : Jiffy.parseFromDateTime(task
                                                                    .date
                                                                    .add(const Duration(
                                                                        days:
                                                                            1)))
                                                                .fromNow(),
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: Color(task
                                                              .color ??
                                                          Theme.of(context)
                                                              .primaryColorLight
                                                              .value),
                                                      radius: 10,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            TextButton(
                                onPressed: () async {
                                  var task = OnGoingTask(
                                      title: "Finish the notes", date: now);
                                  await taskEditorDialog(
                                      context,
                                      task,
                                      Utils.setOfAllPeriodsOfTimetable(
                                              userTimetable)
                                          .map((e) => e.subject)
                                          .toSet());
                                  await isar.writeTxn(() async =>
                                      await isar.onGoingTasks.put(task));
                                },
                                child: const Text("Add"))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
