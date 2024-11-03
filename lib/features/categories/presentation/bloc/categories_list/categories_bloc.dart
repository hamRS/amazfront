import 'package:amazfront/features/categories/data/model/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<GetCategoriesEvent>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final List<CategoryModel> categories = [];
    // categories = await _categoriesDatasource.getCategories();
    emit(CategoriesLoaded(categories));
  }
}
