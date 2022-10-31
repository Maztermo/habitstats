import 'package:isar/isar.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;
  String? description;

  int? difficulty;
  int? dayFrequency;

  DateTime? startDateTime;

  List<DateTime>? routineCompletedDateTimes;

  //String category;
  //late DateTime lastDateTime;
}
