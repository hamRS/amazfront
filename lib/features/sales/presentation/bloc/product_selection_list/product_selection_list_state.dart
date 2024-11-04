part of 'product_selection_list_bloc.dart';

class ProductSelectionListState extends Equatable {
  const ProductSelectionListState({
    this.detailList = const <SaleDetailEntity>[],
  });

  final List<SaleDetailEntity> detailList;

  ProductSelectionListState copyWith({
    List<SaleDetailEntity>? detailList,
  }) {
    return ProductSelectionListState(
      detailList: detailList ?? this.detailList,
    );
  }

  @override
  List<Object> get props => [
        detailList,
      ];
}
