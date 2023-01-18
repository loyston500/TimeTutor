import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:timetutor/dialogs/color_picker.dart';
import 'package:timetutor/db.dart';
import 'package:timetutor/models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                    currentSettings.displayPrevPeriod = value;
                    isar.writeTxn(
                        () => isar.currentSettings.put(currentSettings));
                  });
                },
                initialValue: currentSettings.displayPrevPeriod,
                leading: const Icon(Icons.format_paint),
                title: const Text('Display previous period'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    currentSettings.mainBarGradient = value;
                    isar.writeTxn(
                        () => isar.currentSettings.put(currentSettings));
                  });
                },
                initialValue: currentSettings.mainBarGradient,
                leading: const Icon(Icons.gradient),
                title: const Text('Use gradient for progress bar'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    currentSettings.enablePeriodNameShadow = value;
                    isar.writeTxn(
                        () => isar.currentSettings.put(currentSettings));
                  });
                },
                initialValue: currentSettings.enablePeriodNameShadow,
                leading: const Icon(Icons.image),
                title: const Text('Display period name shadow'),
              ),
              SettingsTile.navigation(
                title: const Text("Pick Color Theme"),
                onPressed: (context) async {
                  Color? color = await colorPickerDialog(
                      context, Color(currentSettings.themeColor));
                  if (color != null) {
                    setState(() {
                      currentSettings.themeColor = color.value;
                      currentSettings.customThemeId = "";
                      isar.writeTxn(
                          () => isar.currentSettings.put(currentSettings));
                    });
                  }
                },
                trailing: const Icon(Icons.color_lens),
              ),
              SettingsTile.navigation(
                title: const Text(
                  "Cyberpunk Theme",
                  style: TextStyle(fontFamily: "Cyberpunk"),
                ),
                onPressed: (context) {
                  setState(() {
                    currentSettings.customThemeId = "cyberpunk";
                    isar.writeTxn(
                        () => isar.currentSettings.put(currentSettings));
                  });
                },
              ),
              SettingsTile.switchTile(
                  initialValue: currentSettings.darkMode,
                  onToggle: (value) {
                    setState(() {
                      currentSettings.darkMode = value;
                      isar.writeTxn(
                          () => isar.currentSettings.put(currentSettings));
                    });
                  },
                  title: const Text("Dark mode"))
            ],
          ),
          SettingsSection(title: const Text("Timetable"), tiles: [
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  currentSettings.timetableAutoPlayPeriodsAnimation = value;
                  isar.writeTxn(
                      () => isar.currentSettings.put(currentSettings));
                });
              },
              initialValue: currentSettings.timetableAutoPlayPeriodsAnimation,
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
              initialValue: currentSettings.timetableEnableInfiniteScroll,
              onToggle: (value) => setState(() {
                currentSettings.timetableEnableInfiniteScroll = value;
                isar.writeTxn(() => isar.currentSettings.put(currentSettings));
              }),
              title: const Text("Enable infinite scroll"),
            )
          ]),
        ],
      ),
    );
  }
}
