import 'package:isar/isar.dart';

part 'region.g.dart';

@Collection()
@Name("Region")
class Region {
  @Id()
  late int id;

  late String name;
}
