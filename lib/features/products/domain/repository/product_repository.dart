import 'package:amazfront/features/products/domain/entity/product_entity.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProduct(String id);
  Future<void> addProduct(ProductEntity product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(String id);
}
