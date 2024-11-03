import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_handling_event.dart';
part 'crud_handling_state.dart';

class CrudHandlingBloc extends Bloc<CrudHandlingEvent, CrudHandlingState> {
  CrudHandlingBloc() : super(CrudHandlingInitial()) {
    on<CrudHandlingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
