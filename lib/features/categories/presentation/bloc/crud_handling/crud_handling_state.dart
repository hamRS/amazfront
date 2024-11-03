part of 'crud_handling_bloc.dart';

sealed class CrudHandlingState extends Equatable {
  const CrudHandlingState();
  
  @override
  List<Object> get props => [];
}

final class CrudHandlingInitial extends CrudHandlingState {}
