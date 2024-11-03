import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.name,
    required this.id,
  });
  final String name;
  final String id;

  CategoryEntity copyWith({
    String? name,
    String? id,
  }) {
    return CategoryEntity(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
