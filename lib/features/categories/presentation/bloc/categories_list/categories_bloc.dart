import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.categoriesRepository})
      : super(
          const CategoriesState(),
        ) {
    on<GetCategoriesEvent>(_onGetCategories);
    on<FilterCategoriesEvent>(_onFilterCategories);
    on<ResetFilteredListEvent>(_resetFilterCategories);
  }

  final ICategoriesRepository categoriesRepository;

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    final List<CategoryEntity> categories =
        await categoriesRepository.getCategories();
    emit(
      const CategoriesState().copyWith(
        originalList: categories,
        filteredList: categories,
      ),
    );
  }

  Future<void> _onFilterCategories(
    FilterCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    final List<CategoryEntity> filteredList = state.originalList
        .where(
          (category) => category.name.contains(event.value),
        )
        .toList();
    emit(
      state.copyWith(
        filteredList: filteredList,
      ),
    );
  }

  Future<void> _resetFilterCategories(
    ResetFilteredListEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(
      state.copyWith(
        filteredList: state.originalList,
      ),
    );
  }
}
