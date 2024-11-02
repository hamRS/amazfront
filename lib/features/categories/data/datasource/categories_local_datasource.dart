import 'package:amazfront/core/database_helper.dart';
import 'package:amazfront/features/categories/data/datasource/i_categories_datasource.dart';
import 'package:amazfront/features/categories/data/model/category_model.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';

class CategoriesLocalDatasource implements ICategoriesDatasource {
  const CategoriesLocalDatasource({required this.localDB});

  final AmazFrontDataBaseHelper localDB;
  @override
  Future<CategoryModel> createCategory(String name) {
    final catModel = CategoryModel(
      id: const Uuid().v4(),
      nombre: name,
    );
    localDB.database.then(
      (Database db) {
        db.insert(
          'CATEGORY',
          catModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
    return Future.value(catModel);
  }

  @override
  Future<void> deleteCategory(String id) {
    localDB.database.then(
      (Database db) {
        db.delete(
          'CATEGORY',
          where: 'id = ?',
          whereArgs: [id],
        );
      },
    );
    return Future.value();
  }

  @override
  Future<List<CategoryModel>> getCategories() {
    return localDB.database.then(
      (Database db) {
        final List<CategoryModel> categories = [];
        db.query('CATEGORY').then(
          (List<Map<String, dynamic>> value) {
            for (final Map<String, dynamic> item in value) {
              categories.add(
                CategoryModel(
                  id: item['id'],
                  nombre: item['nombre'],
                ),
              );
            }
          },
        );
        return categories;
      },
    );
  }

  @override
  Future<CategoryModel> getCategory(String id) {
    return localDB.database.then(
      (Database db) {
        final List<CategoryModel> categories = [];
        db.query(
          'CATEGORY',
          where: 'id = ?',
          whereArgs: [id],
        ).then(
          (List<Map<String, dynamic>> value) {
            for (final Map<String, dynamic> item in value) {
              categories.add(
                CategoryModel(
                  id: item['id'],
                  nombre: item['nombre'],
                ),
              );
            }
          },
        );
        return categories.first;
      },
    );
  }

  @override
  Future<CategoryModel> updateCategory(CategoryModel category) {
    localDB.database.then(
      (Database db) {
        db.update(
          'CATEGORY',
          category.toMap(),
          where: 'id = ?',
          whereArgs: [category.id],
        );
      },
    );
    return Future.value(category);
  }
}
