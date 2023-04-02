import 'package:isar/isar.dart';

part 'open_day.g.dart';

@Collection()
@Name("OpenDay")
class OpenDay {
  Id id = Isar.autoIncrement;

  @Index()
  int year = 0;

  @Index()
  late String day;

  @Index()
  late int locationId;

  @Index(type: IndexType.value, unique: true)
  String get compIndex => '${locationId.toString()}$day';

  bool active = true;
  int changeIndex = 0;
}
