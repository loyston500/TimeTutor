import 'package:isar/isar.dart';

part 'institution.g.dart';

abstract class Institution {
  String? name;
  String? course;
  String? section;
  int? year;
  int? semester;

  Institution({this.name, this.course, this.section, this.semester, this.year});
}

@collection
class UserInstitution extends Institution {
  Id id = 0;
  UserInstitution({
    super.name,
    super.course,
    super.section,
    super.semester,
    super.year,
  });
}
