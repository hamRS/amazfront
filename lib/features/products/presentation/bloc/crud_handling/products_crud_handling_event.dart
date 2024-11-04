part of 'products_crud_handling_bloc.dart';

sealed class ProductsCrudHandlingEvent extends Equatable {
  const ProductsCrudHandlingEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsCrudHandlingEvent {
  const GetProductsEvent();
}

class FilterProductsByNameEvent extends ProductsCrudHandlingEvent {
  const FilterProductsByNameEvent({required this.value});
  final String value;
}

class FilterProductsByCategoryEvent extends ProductsCrudHandlingEvent {
  const FilterProductsByCategoryEvent({required this.value});
  final String value;
}
