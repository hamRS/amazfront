import 'package:amazfront/features/products/data/datasource/i_product_datasource.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';
import 'package:amazfront/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  const ProductRepositoryImpl({required this.dataSource});

  final IProductDataSource dataSource;

  @override
  Future<List<Product>> getAllProducts() async {
    return dataSource.getAllProducts();
  }

  @override
  Future<Product> getProductById(String id) async {
    final product = await dataSource.readProduct(id);
    if (product == null) {
      throw Exception('Product not found');
    }
    return product;
  }

  @override
  Future<void> addProduct(Product product) async {
    await dataSource.createProduct(product.nombre,product.precioVenta,product.categoria);
  }

  @override
  Future<void> updateProduct(Product product) async {
    return dataSource.updateProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    return dataSource.deleteProduct(id);
  }
}