import 'package:isar/isar.dart';

part 'subject.g.dart';

@embedded
class Subject {
  late String name;

  Subject();

  @override
  bool operator ==(Object other) {
    return other is Subject && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
