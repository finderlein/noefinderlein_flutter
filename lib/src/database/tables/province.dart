import 'package:isar/isar.dart';

part 'province.g.dart';

@Collection()
@Name("Province")
class Province {
  late Id id;

  late String name;
}
