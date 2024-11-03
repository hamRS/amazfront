part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent();
}

class FilterCategoriesEvent extends CategoriesEvent {
  const FilterCategoriesEvent({required this.value});
  final String value;
}

class ResetFilteredListEvent extends CategoriesEvent {
  const ResetFilteredListEvent();
}
