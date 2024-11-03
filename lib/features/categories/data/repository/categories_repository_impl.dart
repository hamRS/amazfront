import 'package:amazfront/features/categories/data/datasource/i_categories_datasource.dart';
import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl implements ICategoriesRepository {
  const CategoriesRepositoryImpl({required this.localDatasource});

  final ICategoriesDatasource localDatasource;

  @override
  Future<CategoryEntity> createCategory(String name) async {
    return localDatasource.createCategory(name);
  }

  @override
  Future<void> deleteCategory(String id) {
    return localDatasource.deleteCategory(id);
  }

  @override
  Future<List<CategoryEntity>> getCategories() {
    return localDatasource.getCategories();
  }

  @override
  Future<CategoryEntity> getCategory(String id) {
    return localDatasource.getCategory(id);
  }

  @override
  Future<CategoryEntity> updateCategory(CategoryEntity category) {
    return localDatasource.updateCategory(category);
  }
}
