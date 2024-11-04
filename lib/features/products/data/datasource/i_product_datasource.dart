import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';

abstract class IProductDataSource {
  Future<Product> createProduct(String name, double price,CategoryEntity category);
  Future<Product?> readProduct(String id);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<List<Product>> getAllProducts();
}
