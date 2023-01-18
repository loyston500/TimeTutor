import 'package:isar/isar.dart';

part 'teacher.g.dart';

abstract class Teacher {
  String name;
  String? phoneNumber;

  Teacher({required this.name, this.phoneNumber});
}

@collection
class UserTeacher extends Teacher {
  Id id = Isar.autoIncrement;
  UserTeacher({required super.name, super.phoneNumber});
}
