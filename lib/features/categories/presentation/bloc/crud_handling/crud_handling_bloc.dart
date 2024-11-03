import 'package:amazfront/features/categories/domain/entity/category_entity.dart';
import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_handling_event.dart';
part 'crud_handling_state.dart';

class CrudHandlingBloc extends Bloc<CrudHandlingEvent, CrudHandlingState> {
  CrudHandlingBloc({
    required this.categoryRepository,
  }) : super(CrudHandlingInitial()) {
    on<CreateCategoryButtonPressed>(_onCreateCategory);
    on<DeleteCategoryButtonPressed>(_onDeleteCategory);
  }

  final ICategoriesRepository categoryRepository;

  Future<void> _onCreateCategory(
    CreateCategoryButtonPressed event,
    Emitter<CrudHandlingState> emit,
  ) async {
    emit(CrudHandlingLoading());
    final CategoryEntity category =
        await categoryRepository.createCategory(event.name);
    emit(CrudHandlingSuccess(category));
  }

  Future<void> _onDeleteCategory(
    DeleteCategoryButtonPressed event,
    Emitter<CrudHandlingState> emit,
  ) async {
    await categoryRepository.deleteCategory(
      event.category.id,
    );
  }
}
