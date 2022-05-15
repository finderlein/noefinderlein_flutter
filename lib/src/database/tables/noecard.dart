import 'package:isar/isar.dart';

part 'noecard.g.dart';

@Collection()
@Name("Noecard")
class Noecard {
  @Id()
  late int id = Isar.autoIncrement;

  late String name;
  late String qrData;
  late String kartenId;
}
