import 'package:amazfront/features/categories/domain/entity/category_entity.dart';

class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
  });
  final String id;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': name,
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}
