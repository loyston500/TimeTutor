import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MainSettings {
  bool displayPrevPeriod = true;
}

class MainSettingsPage extends StatefulWidget {
  const MainSettingsPage({super.key, required this.settings});

  final MainSettings settings;

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SettingsList(
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
            ],
          ),
        ],
      ),
    );
  }
}
