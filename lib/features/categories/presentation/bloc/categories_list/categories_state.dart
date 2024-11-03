part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    this.originalList = const <CategoryEntity>[],
    this.filteredList = const <CategoryEntity>[],
  });

  final List<CategoryEntity> originalList;
  final List<CategoryEntity> filteredList;

  CategoriesState copyWith({
    List<CategoryEntity>? originalList,
    List<CategoryEntity>? filteredList,
  }) {
    return CategoriesState(
      originalList: originalList ?? this.originalList,
      filteredList: filteredList ?? this.filteredList,
    );
  }

  @override
  List<Object> get props => [
        originalList,
        filteredList,
      ];
}
