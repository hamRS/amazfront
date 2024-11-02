import 'package:amazfront/features/categories/data/model/category_model.dart';

abstract class ICategoriesDatasource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> getCategory(String id);
  Future<CategoryModel> createCategory(String name);
  Future<CategoryModel> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String id);
}
