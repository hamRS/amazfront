import 'package:amazfront/features/products/data/datasource/i_products_datasourse.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';

class ProductsMockDatasource implements IProductsDatasourse {
  @override
  Future<ProductEntity> addProduct(ProductEntity product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductEntity> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductEntity> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    return Future.value([
      ProductEntity(
        id: '1',
        name: 'Product 1',
        price: 100.0,
        category: null,
      ),
      ProductEntity(
        id: '2',
        name: 'Product 2',
        price: 200.0,
        category: null,
      ),
      ProductEntity(
        id: '3',
        name: 'Product 3',
        price: 300.0,
        category: null,
      ),
    ]);
  }

  @override
  Future<ProductEntity> updateProduct(ProductEntity product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
