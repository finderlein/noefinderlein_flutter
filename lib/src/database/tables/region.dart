import 'package:isar/isar.dart';

part 'region.g.dart';

@Collection()
@Name("Region")
class Region {
  late Id id;

  late String name;
}
