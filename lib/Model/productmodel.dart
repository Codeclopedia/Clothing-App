// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

part 'productmodel.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String Product_Uniqueid;
  @HiveField(1)
  late String Product_name;
  @HiveField(2)
  late String Product_description;
  @HiveField(3)
  late List<String> Product_imageurl;
  @HiveField(4)
  late List Product_color_available;
  @HiveField(5)
  late List<Map> Product_size_n_price;
  @HiveField(6)
  late List<Map> Product_reviews;
  @HiveField(7)
  late List<String> Product_type;
  Product({
    this.Product_Uniqueid = "unique id",
    required this.Product_name,
    required this.Product_description,
    required this.Product_imageurl,
    required this.Product_color_available,
    required this.Product_size_n_price,
    this.Product_type = const [],
    required this.Product_reviews,
  });
}
