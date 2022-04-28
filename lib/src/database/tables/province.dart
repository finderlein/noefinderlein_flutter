import 'package:isar/isar.dart';

part 'province.g.dart';

@Collection()
@Name("Province")
class Province {
  @Id()
  late int id;

  late String name;
}
