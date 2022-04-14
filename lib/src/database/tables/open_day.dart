import 'package:isar/isar.dart';

part 'open_day.g.dart';

@Collection()
@Name("OpenDay")
class OpenDay {
  @Id()
  int id = Isar.autoIncrement;

  late String day;
  late int locationId;

  int year = 0;
  bool active = true;
  int changeIndex = 0;
}
