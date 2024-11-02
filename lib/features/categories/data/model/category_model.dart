class CategoryModel {
  const CategoryModel({required this.id, required this.nombre});
  final String id;
  final String nombre;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
