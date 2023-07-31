import 'package:isar/isar.dart';

part 'holiday.g.dart';

abstract class Holiday {
  late String name;
  late DateTime date;

  Holiday({required this.name, required this.date});
}

@collection
class UserHoliday extends Holiday {
  Id id = Isar.autoIncrement;
  UserHoliday({required super.name, required super.date});
}
