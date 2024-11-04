part of 'product_selection_list_bloc.dart';

sealed class ProductSelectionListEvent extends Equatable {
  const ProductSelectionListEvent();

  @override
  List<Object> get props => [];
}

class AddProductButtonPressed extends ProductSelectionListEvent {
  const AddProductButtonPressed({
    required this.product,
  });

  final ProductEntity product;

  @override
  List<Object> get props => [
        product,
      ];
}

class RemoveProductButtonPressed extends ProductSelectionListEvent {
  const RemoveProductButtonPressed({
    required this.product,
  });

  final ProductEntity product;

  @override
  List<Object> get props => [
        product,
      ];
}
