part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesLoaded(this.categories);
  @override
  List<Object> get props => [
        categories,
      ];
  CategoriesLoaded copyWith({
    List<CategoryModel>? categories,
  }) {
    return CategoriesLoaded(
      categories ?? this.categories,
    );
  }
}
