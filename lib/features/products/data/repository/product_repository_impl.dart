import 'package:amazfront/features/products/data/datasource/i_products_datasourse.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';
import 'package:amazfront/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  const ProductRepositoryImpl({required this.productsDatasourse});

  final IProductsDatasourse productsDatasourse;

  @override
  Future<void> addProduct(ProductEntity product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductEntity> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    return productsDatasourse.getProducts();
  }

  @override
  Future<void> updateProduct(ProductEntity product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
