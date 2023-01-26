import 'package:isar/isar.dart';
import 'package:timetutor/models/models.dart';

part 'tasks.g.dart';

abstract class Task {
  String title;
  String? description;
  int? color;
  DateTime date;
  Subject? subject;

  Task({
    required this.title,
    required this.date,
    this.description,
    this.color,
    this.subject,
  });
}

@collection
class CompletedTask extends Task {
  Id id = Isar.autoIncrement;
  CompletedTask({
    required super.title,
    required super.date,
    super.description,
    super.color,
    super.subject,
  });
}

@collection
class OnGoingTask extends Task {
  Id id = Isar.autoIncrement;
  OnGoingTask({
    required super.title,
    required super.date,
    super.description,
    super.color,
    super.subject,
  });
}
