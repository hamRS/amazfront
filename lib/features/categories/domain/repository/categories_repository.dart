import 'package:amazfront/features/categories/domain/entity/category_entity.dart';

abstract class ICategoriesRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity> getCategory(String id);
  Future<CategoryEntity> createCategory(String name);
  Future<CategoryEntity> updateCategory(CategoryEntity category);
  Future<void> deleteCategory(String id);
}
