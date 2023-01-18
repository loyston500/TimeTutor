import 'package:timetutor/models/models.dart';
import 'package:isar/isar.dart';

part 'period.g.dart';

@embedded
class Period {
  late Subject subject;
  late Timing timing;

  Period();

  factory Period.create({required Subject subject, required Timing timing}) {
    return Period()
      ..subject = subject
      ..timing = timing;
  }

  @override
  bool operator ==(Object other) {
    return other is Period &&
        other.subject == subject &&
        other.timing == timing;
  }

  @override
  int get hashCode => Object.hash(subject, timing);
}
