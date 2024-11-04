part of 'products_crud_handling_bloc.dart';

class ProductsCrudHandlingState extends Equatable {
  const ProductsCrudHandlingState({
    this.originalProductList = const <ProductEntity>[],
    this.filteredProductList = const <ProductEntity>[],
  });

  final List<ProductEntity> originalProductList;
  final List<ProductEntity> filteredProductList;

  ProductsCrudHandlingState copyWith({
    List<ProductEntity>? originalProductList,
    List<ProductEntity>? filteredProductList,
  }) {
    return ProductsCrudHandlingState(
      originalProductList: originalProductList ?? this.originalProductList,
      filteredProductList: filteredProductList ?? this.filteredProductList,
    );
  }

  @override
  List<Object> get props => [
        originalProductList,
        filteredProductList,
      ];
}
