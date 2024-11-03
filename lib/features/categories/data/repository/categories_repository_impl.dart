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
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<CategoryEntity> getCategory(String id) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<CategoryEntity> updateCategory(CategoryEntity category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
