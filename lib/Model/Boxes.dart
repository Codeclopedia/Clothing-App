import 'package:clothing_app/Model/productmodel.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Product> getProductBoxinstance() => Hive.box<Product>("Product");
}
