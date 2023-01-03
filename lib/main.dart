import 'package:flutter/material.dart';
import 'impls/impls.dart';

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
        primarySwatch: Colors.yellow,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var tod = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeTable timeTable = timeTableSample();
    var periods = timeTable.returnDayPeriods(now.weekday);

    List<Period> currentPeriods = periods.where((period) {
      var d = Timing.timeOfDayAsDouble(tod);
      return (d >= Timing.timeOfDayAsDouble(period.timing.from) &&
          d < Timing.timeOfDayAsDouble(period.timing.to));
    }).toList()
      ..sort((a, b) => Timing.timeOfDayAsDouble(a.timing.from)
          .compareTo(Timing.timeOfDayAsDouble(b.timing.from)));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Time Tutor'),
        ),
        body: SingleChildScrollView(
          child:
              Text(currentPeriods.map((e) => e.toJson()).toList().toString()),
        ));
  }
}
