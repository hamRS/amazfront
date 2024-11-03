part of 'crud_handling_bloc.dart';

sealed class CrudHandlingEvent extends Equatable {
  const CrudHandlingEvent();

  @override
  List<Object> get props => [];
}

class CreateCategoryButtonPressed extends CrudHandlingEvent {
  const CreateCategoryButtonPressed({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}

class UpdateCategoryButtonPressed extends CrudHandlingEvent {
  const UpdateCategoryButtonPressed(
    this.category,
  );

  final CategoryEntity category;

  @override
  List<Object> get props => [category];
}

class DeleteCategoryButtonPressed extends CrudHandlingEvent {
  const DeleteCategoryButtonPressed({
    required this.category,
  });

  final CategoryEntity category;

  @override
  List<Object> get props => [
        category,
      ];
}
