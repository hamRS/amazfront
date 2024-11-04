import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.idProducto,
    required this.nombre,
    required this.precioVenta,
    required this.categoria,
  });
  final String idProducto;
  final String nombre;
  final double precioVenta;
  final CategoryEntity categoria; // Assuming Categoria is a class representing the category

  Product copyWith({
    String? idProducto,
    String? nombre,
    double? precioVenta,
    CategoryEntity? categoria,
  }) {
    return Product(
      idProducto: idProducto ?? this.idProducto,
      nombre: nombre ?? this.nombre,
      precioVenta: precioVenta ?? this.precioVenta,
      categoria: categoria ?? this.categoria,
    );
  }

  @override
  List<Object> get props => [idProducto, nombre, precioVenta, categoria];
}
