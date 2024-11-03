part of 'crud_handling_bloc.dart';

sealed class CrudHandlingEvent extends Equatable {
  const CrudHandlingEvent();

  @override
  List<Object> get props => [];
}

class CreateCategoryButtonPressed extends CrudHandlingEvent {
  final String name;
  const CreateCategoryButtonPressed(
    this.name,
  );

  @override
  List<Object> get props => [name];
}

class UpdateCategoryButtonPressed extends CrudHandlingEvent {
  final CategoryEntity category;
  const UpdateCategoryButtonPressed(
    this.category,
  );

  @override
  List<Object> get props => [category];
}

class DeleteCategoryButtonPressed extends CrudHandlingEvent {
  final CategoryEntity category;
  const DeleteCategoryButtonPressed(
    this.category,
  );

  @override
  List<Object> get props => [
        category,
      ];
}
