import 'package:amazfront/features/categories/domain/entity/category_entity.dart';

class ProductEntity {
  ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });
  final String id;
  final String name;
  final CategoryEntity? category;
  final double price;
}
