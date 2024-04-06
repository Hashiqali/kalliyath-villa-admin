import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addvilla_event.dart';
part 'addvilla_state.dart';

class AddvillaBloc extends Bloc<AddvillaEvent, AddvillaState> {
  AddvillaBloc() : super(AddvillaInitial()) {
    on<AcCheckboxcCick>(acCheckboxcCick);
    on<AdvillaInitial>(advillaInitial);
  }

  FutureOr<void> acCheckboxcCick(
      AcCheckboxcCick event, Emitter<AddvillaState> emit) {
    if (state is AcCheckboxcCickstate) {
      emit(AcCheckboxcCickedstate(istrue: event.istrue));
    } else {
      emit(AcCheckboxcCickstate(istrue: event.istrue));
    }
  }

  FutureOr<void> advillaInitial(
      AdvillaInitial event, Emitter<AddvillaState> emit) {
    emit(AcCheckboxcCickstate(istrue: false));
  }
}
