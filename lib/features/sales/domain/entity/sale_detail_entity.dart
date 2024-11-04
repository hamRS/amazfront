import 'package:amazfront/features/products/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class SaleDetailEntity extends Equatable {
  SaleDetailEntity({
    this.idDetalleVenta,
    this.idVenta,
    required this.producto,
    required this.cantidad,
    required this.precio,
  });
  final String? idDetalleVenta;
  final String? idVenta;
  final ProductEntity producto;
  final double cantidad;
  final double precio;

  SaleDetailEntity copyWith({
    String? idDetalleVenta,
    String? idVenta,
    ProductEntity? producto,
    double? cantidad,
    double? precio,
  }) {
    return SaleDetailEntity(
      idDetalleVenta: idDetalleVenta ?? this.idDetalleVenta,
      idVenta: idVenta ?? this.idVenta,
      producto: producto ?? this.producto,
      cantidad: cantidad ?? this.cantidad,
      precio: precio ?? this.precio,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        idDetalleVenta,
        idVenta,
        producto,
        cantidad,
        precio,
      ];
}
