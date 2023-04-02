import 'package:isar/isar.dart';

part 'change_val.g.dart';

@Collection()
@Name("ChangeVal")
class ChangeVal {
  late Id year;

  int changeCount = 0;
}
