import 'package:timetutor/models/models.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;
late CurrentSettings currentSettings;
late List<OnGoingTask> onGoingTasks;
late UserTimetable userTimetable;

class Db {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [CurrentSettingsSchema, OnGoingTaskSchema, UserTimetableSchema],
        directory: dir.path);

    await Db.initCurrentSettings();
    await Db.initOnGoingTasks();
    await Db.initUserTimeTable();
  }

  static initCurrentSettings() async {
    if (await isar.currentSettings.get(0) == null) {
      await isar.writeTxn(() async {
        currentSettings = CurrentSettings();
        await isar.currentSettings.put(currentSettings);
      });
    } else {
      currentSettings = (await isar.currentSettings.get(0))!;
    }

    final stream1 = isar.currentSettings.watchObject(0, fireImmediately: true);
    stream1.listen((newValue) async {
      if (newValue != null) {
        currentSettings = newValue;
      }
    });
  }

  static initOnGoingTasks() async {
    onGoingTasks = await isar.onGoingTasks.where().findAll();
    final stream1 =
        isar.onGoingTasks.where().build().watch(fireImmediately: true);
    stream1.listen((newValue) {
      onGoingTasks = newValue;
    });
  }

  static initUserTimeTable() async {
    if (await isar.userTimetables.get(0) == null) {
      await isar.writeTxn(() async {
        userTimetable = UserTimetable.blank();
        await isar.userTimetables.put(userTimetable);
      }, silent: true);
    } else {
      userTimetable = (await isar.userTimetables.get(0))!;
    }

    final stream1 = isar.userTimetables.watchObject(0, fireImmediately: true);
    stream1.listen((newValue) {
      if (newValue != null) {
        userTimetable = newValue;
      }
    });
  }
}
