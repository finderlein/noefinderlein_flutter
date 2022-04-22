import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
@Name("Category")
class Category {
  @Id()
  late int id;

  late String name;
}
