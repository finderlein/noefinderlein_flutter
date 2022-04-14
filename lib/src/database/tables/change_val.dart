import 'package:isar/isar.dart';

part 'change_val.g.dart';

@Collection()
@Name("ChangeVal")
class ChangeVal {
  @Id()
  int? year;

  int changeCount = 0;
}
