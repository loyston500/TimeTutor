import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:timetutor/main.dart';
import 'package:timetutor/themes/themes.dart';
import 'dart:math' as math;

class MainSettings {
  bool displayPrevPeriod = true;
  bool timetableAutoPlayPeriodsAnimation = false;
  int timetableAutoPlayInterval = 3;
  bool timetableEnableInfiniteScroll = true;
  bool darkMode = true;
}

class MainSettingsPage extends StatefulWidget {
  const MainSettingsPage(
      {super.key, required this.settings, required this.root});

  final MainSettings settings;
  final AppState Function() root;

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsTileTextColor: Theme.of(context).textTheme.bodyText2!.color,
          titleTextColor: Theme.of(context).iconTheme.color,
          settingsListBackground: Theme.of(context).backgroundColor,
        ),
        lightTheme: SettingsThemeData(
          settingsTileTextColor: Theme.of(context).textTheme.bodyText2!.color,
          titleTextColor: Theme.of(context).iconTheme.color,
          settingsListBackground: Theme.of(context).backgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: [
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    widget.settings.displayPrevPeriod = value;
                  });
                },
                initialValue: widget.settings.displayPrevPeriod,
                leading: const Icon(Icons.format_paint),
                title: const Text('Display previous period'),
              ),
              SettingsTile.navigation(
                title: Text("Theme"),
                onPressed: (context) {
                  final color = Colors.primaries[
                      math.Random().nextInt(Colors.primaries.length)];
                  widget.root().setDarkTheme(
                        Themes.themeFromPrimaryColor(color, ThemeMode.dark),
                      );
                  widget.root().setLightTheme(
                        Themes.themeFromPrimaryColor(color, ThemeMode.light),
                      );
                },
              ),
              SettingsTile.switchTile(
                  initialValue: widget.settings.darkMode,
                  onToggle: (value) {
                    widget.settings.darkMode = value;
                    setState(() {});
                    widget.root().refresh();
                  },
                  title: Text("Dark mode"))
            ],
          ),
          SettingsSection(title: const Text("Timetable"), tiles: [
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  widget.settings.timetableAutoPlayPeriodsAnimation = value;
                });
              },
              initialValue: widget.settings.timetableAutoPlayPeriodsAnimation,
              leading: const Icon(Icons.autofps_select_sharp),
              title: const Text('Auto play periods animation'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.timer_sharp),
              title: const Text("Auto play interval"),
              onPressed: (context) {
                Navigator.of(context).pop();
              },
            ),
            SettingsTile.switchTile(
              initialValue: widget.settings.timetableEnableInfiniteScroll,
              onToggle: (value) => setState(
                  () => widget.settings.timetableEnableInfiniteScroll = value),
              title: const Text("Enable infinite scroll"),
            )
          ]),
        ],
      ),
    );
  }
}
