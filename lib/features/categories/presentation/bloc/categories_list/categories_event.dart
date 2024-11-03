part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent();
}

class FilterCategories extends CategoriesEvent {
  final String id;
  const FilterCategories(this.id);
}
