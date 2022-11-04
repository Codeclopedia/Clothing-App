import 'package:hive/hive.dart';

class Boxes {
  static Box getBoxinstance() => Hive.box("Products");
}
