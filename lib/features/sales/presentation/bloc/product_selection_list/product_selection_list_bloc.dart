import 'package:amazfront/features/products/domain/entity/product_entity.dart';
import 'package:amazfront/features/sales/domain/entity/sale_detail_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_selection_list_event.dart';
part 'product_selection_list_state.dart';

class ProductSelectionListBloc
    extends Bloc<ProductSelectionListEvent, ProductSelectionListState> {
  ProductSelectionListBloc()
      : super(
          const ProductSelectionListState(),
        ) {
    on<AddProductButtonPressed>(_addProductToList);
  }

  Future<void> _addProductToList(
    AddProductButtonPressed event,
    Emitter<ProductSelectionListState> emit,
  ) async {
    final List<SaleDetailEntity> details = state.detailList;
    final List<SaleDetailEntity?> productsFinderList = state.detailList;
    final detailsIndex = productsFinderList.indexWhere(
      (product) => product!.producto.id == event.product.id,
    );
    if (detailsIndex != -1) {
      final SaleDetailEntity product = details[detailsIndex];
      final SaleDetailEntity newProduct = product.copyWith(
        cantidad: product.cantidad + 1,
        precio: product.producto.price * (product.cantidad + 1),
      );
      details[detailsIndex] = newProduct;
    } else {
      final SaleDetailEntity newProduct = SaleDetailEntity(
        producto: event.product,
        cantidad: 1,
        precio: event.product.price,
      );
      details.add(newProduct);
    }
    emit(
      state.copyWith(
        detailList: details,
      ),
    );
  }
}
