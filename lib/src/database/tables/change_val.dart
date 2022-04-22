import 'package:isar/isar.dart';

part 'change_val.g.dart';

@Collection()
@Name("ChangeVal")
class ChangeVal {
  @Id()
  late int year;

  int changeCount = 0;
}
