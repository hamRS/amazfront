import 'package:amazfront/features/clients/domain/client_entity.dart';

class SaleEntity {
  const SaleEntity({
    required this.id,
    required this.date,
    required this.client,
    required this.total,
  });

  final String id;
  final DateTime date;
  final ClientEntity client;
  final double total;
}
