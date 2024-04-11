import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:meta/meta.dart';

part 'addvilla_event.dart';
part 'addvilla_state.dart';

class AddvillaBloc extends Bloc<AddvillaEvent, AddvillaState> {
  AddvillaBloc() : super(AddvillaInitial()) {
    on<AcCheckboxcCick>(acCheckboxcCick);
    on<AdvillaInitial>(advillaInitial);
    on<Photobuilder>(photobuilder);
    on<Dropdownbuilder>(dropdownbuilder);
    on<Lodingbuilder>(lodingbuilder);
    on<Locationbuilder>(locationbuilder);
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

  FutureOr<void> photobuilder(Photobuilder event, Emitter<AddvillaState> emit) {
    emit(photobuilderstate());
  }

  FutureOr<void> dropdownbuilder(
      Dropdownbuilder event, Emitter<AddvillaState> emit) {
    emit(Dropdownbuilderstate());
  }

  FutureOr<void> lodingbuilder(
      Lodingbuilder event, Emitter<AddvillaState> emit) {
    if (state is Lodingbuilderstate1) {
      emit(Lodingbuilderstate2());
    } else {
      emit(Lodingbuilderstate1());
    }
  }

  FutureOr<void> locationbuilder(
      Locationbuilder event, Emitter<AddvillaState> emit) {
    if (location != '') {
      emit(LocationbuilderState());
    }
  }
}
