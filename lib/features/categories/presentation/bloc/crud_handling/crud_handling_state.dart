part of 'crud_handling_bloc.dart';

sealed class CrudHandlingState extends Equatable {
  const CrudHandlingState();

  @override
  List<Object> get props => [];
}

final class CrudHandlingInitial extends CrudHandlingState {}

final class CrudHandlingLoading extends CrudHandlingState {}

final class CrudHandlingSuccess extends CrudHandlingState {
  final CategoryEntity category;

  const CrudHandlingSuccess(this.category);
  @override
  List<Object> get props => [
        category,
      ];
}
