import 'package:amazfront/features/products/domain/entity/product_entity.dart';

abstract class IProductsDatasourse {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProductById(String id);
  Future<ProductEntity> addProduct(ProductEntity product);
  Future<ProductEntity> updateProduct(ProductEntity product);
  Future<ProductEntity> deleteProduct(String id);
}
