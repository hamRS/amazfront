import 'package:amazfront/features/products/domain/entity/product_entity.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String id);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
