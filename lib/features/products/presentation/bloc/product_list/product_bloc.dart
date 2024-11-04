// import 'package:amazfront/features/products/domain/entity/product_entity.dart';
// import 'package:amazfront/features/products/domain/repository/products_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc({required this.productsRepository})
//       : super(
//           const ProductState(),
//         ) {
//     on<GetProductsEvent>(_onGetProducts);
//     on<FilterProductsEvent>(_onFilterProducts);
//     on<ResetFilteredListEvent>(_resetFilterProducts);
//   }

//   final IProductsRepository productsRepository;

//   Future<void> _onGetProducts(
//     GetProductsEvent event,
//     Emitter<ProductState> emit,
//   ) async {
//     final List<ProductEntity> products =
//         await productsRepository.getProducts();
//     emit(
//       const ProductState().copyWith(
//         originalList: products,
//         filteredList: products,
//       ),
//     );
//   }

//   Future<void> _onFilterProducts(
//     FilterProductsEvent event,
//     Emitter<ProductState> emit,
//   ) async {
//     final List<ProductEntity> filteredList = state.originalList
//         .where(
//           (product) => product.name.contains(event.value),
//         )
//         .toList();
//     emit(
//       state.copyWith(
//         filteredList: filteredList,
//       ),
//     );
//   }

//   Future<void> _resetFilterProducts(
//     ResetFilteredListEvent event,
//     Emitter<ProductState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         filteredList: state.originalList,
//       ),
//     );
//   }
// }