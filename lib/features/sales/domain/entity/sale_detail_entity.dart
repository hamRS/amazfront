class SaleDetailEntity {
  SaleDetailEntity({
    required this.idDetalleVenta,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
    required this.precio,
  });
  final String idDetalleVenta;
  final String idVenta;
  final String idProducto;
  final double cantidad;
  final double precio;
}
