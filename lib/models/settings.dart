import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'settings.g.dart';

abstract class Settings {
  bool displayPrevPeriod = true;
  bool enablePeriodNameShadow = false;
  bool timetableAutoPlayPeriodsAnimation = false;
  int timetableAutoPlayInterval = 3;
  bool timetableEnableInfiniteScroll = true;
  bool mainBarGradient = true;
  bool darkMode = true;
  int themeColor = Colors.teal.value;
  String customThemeId = "";

  Settings();
}

@collection
class CurrentSettings extends Settings {
  Id id = 0;
}
