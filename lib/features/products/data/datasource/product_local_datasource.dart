import 'package:amazfront/core/database_helper.dart';
import 'package:amazfront/features/products/data/datasource/i_product_datasource.dart';
import 'package:amazfront/features/products/data/model/product_model.dart';
import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';

import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';

class ProductLocalDatasource implements IProductDataSource {
  const ProductLocalDatasource({required this.localDB});

  final AmazFrontDataBaseHelper localDB;

  @override
  Future<Product> createProduct(String name, double price,CategoryEntity category) {
    final productModel = ProductModel(
      idProducto: const Uuid().v4(),
      nombre: name,
      precioVenta: price,
      categoria: category,
    );
    localDB.database.then(
      (Database db) {
        db.insert(
          'PRODUCT',
          productModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
    return Future.value(
      productModel.toEntity(),
    );
  }

  @override
  Future<void> deleteProduct(String id) {
    localDB.database.then(
      (Database db) {
        db.delete(
          'PRODUCT',
          where: 'id = ?',
          whereArgs: [id],
        );
      },
    );
    return Future.value();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final db = await localDB.database;
    final List<Map<String, Object?>> productsMap = await db.query('PRODUCT');
    final List<Product> products = [];
    for (final Map<String, Object?> item in productsMap) {
      products.add(
        Product(
          idProducto: item['idProducto'] as String,
          nombre: item['nombre'] as String,
          precioVenta: item['precioVenta'] as double,
          categoria: item['categoria'] as CategoryEntity,
        ),
      );
    }
    return products;
  }

  @override
  Future<Product> readProduct(String id) {
    return localDB.database.then(
      (Database db) {
        final List<Product> products = [];
        db.query(
          'PRODUCT',
          where: 'id = ?',
          whereArgs: [id],
        ).then(
          (List<Map<String, dynamic>> value) {
            for (final Map<String, dynamic> item in value) {
              products.add(
                Product(
                  idProducto: item['idProducto'],
                  nombre: item['nombre'],
                  precioVenta: item['precioVenta'],
                  categoria: item['categoria'],
                ),
              );
            }
          },
        );
        return products.first;
      },
    );
  }

  @override
  Future<Product> updateProduct(Product product) {
    final ProductModel productModel = ProductModel(
      idProducto: product.idProducto,
      nombre: product.nombre,
      precioVenta: product.precioVenta,
      categoria: product.categoria,
    );
    localDB.database.then(
      (Database db) {
        db.update(
          'PRODUCT',
          productModel.toMap(),
          where: 'id = ?',
          whereArgs: [product.idProducto],
        );
      },
    );
    return Future.value(product);
  }
}