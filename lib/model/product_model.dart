import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
   String category;

  @HiveField(1)
   String subcategory;

  @HiveField(2)
   String title;

  @HiveField(3)
   String price;

  @HiveField(4)
   String description;


  ProductModel({
    required this.category,
    required this.subcategory,
    required this.title,
    required this.price,
    required this.description,
  });
}