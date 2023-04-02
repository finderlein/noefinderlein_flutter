import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
@Name("Category")
class Category {
  late Id id;

  late String name;
}
