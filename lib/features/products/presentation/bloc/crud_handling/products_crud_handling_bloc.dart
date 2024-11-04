import 'package:amazfront/features/products/domain/entity/product_entity.dart';
import 'package:amazfront/features/products/domain/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_crud_handling_event.dart';
part 'products_crud_handling_state.dart';

class ProductsCrudHandlingBloc
    extends Bloc<ProductsCrudHandlingEvent, ProductsCrudHandlingState> {
  ProductsCrudHandlingBloc({
    required this.productRepository,
  }) : super(const ProductsCrudHandlingState()) {
    on<GetProductsEvent>(_onGetProducts);
    on<FilterProductsByNameEvent>(_onFilteredProductsByName);
    on<FilterProductsByCategoryEvent>(_onFitleredProductsByCategory);
  }

  final IProductRepository productRepository;

  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductsCrudHandlingState> emit,
  ) async {
    final List<ProductEntity> products = await productRepository.getProducts();
    emit(
      state.copyWith(
        originalProductList: products,
        filteredProductList: products,
      ),
    );
  }

  Future<void> _onFilteredProductsByName(
    FilterProductsByNameEvent event,
    Emitter<ProductsCrudHandlingState> emit,
  ) async {
    final List<ProductEntity> filteredProducts = state.originalProductList
        .where(
          (product) => product.name.contains(event.value),
        )
        .toList();
    emit(
      state.copyWith(
        filteredProductList: filteredProducts,
      ),
    );
  }

  Future<void> _onFitleredProductsByCategory(
    FilterProductsByCategoryEvent event,
    Emitter<ProductsCrudHandlingState> emit,
  ) async {
    final List<ProductEntity> filteredProducts = state.originalProductList
        .where(
          (product) => product.category!.name == event.value,
        )
        .toList();
    emit(
      state.copyWith(
        filteredProductList: filteredProducts,
      ),
    );
  }
}
