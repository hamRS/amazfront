

import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/products/domain/entity/product_entity.dart';


class ProductModel {
  const ProductModel({
    required this.idProducto,
    required this.nombre,
    required this.categoria,
    required this.precioVenta,
  });

  final String idProducto;
  final String nombre;
  final double precioVenta;
  final CategoryEntity categoria;

  Map<String, dynamic> toMap() {
    return {
      'idProducto': idProducto,
      'nombre': nombre,
      'precioVenta': precioVenta,
      'categoria': categoria,
    };
  }

  Product toEntity() {
    return Product(
      idProducto: idProducto,
      nombre: nombre,
      precioVenta: precioVenta,
      categoria: categoria,
    );
  }
}