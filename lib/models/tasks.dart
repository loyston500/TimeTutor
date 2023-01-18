import 'package:isar/isar.dart';

part 'tasks.g.dart';

abstract class Task {
  String name;
  String? description;
  int? color;
  DateTime date;

  Task({required this.name, required this.date, this.description, this.color});
}

@collection
class CompletedTask extends Task {
  Id id = Isar.autoIncrement;
  CompletedTask({
    required super.name,
    required super.date,
    super.description,
    super.color,
  });
}

@collection
class OnGoingTask extends Task {
  Id id = Isar.autoIncrement;
  OnGoingTask({
    required super.name,
    required super.date,
    super.description,
    super.color,
  });
}
