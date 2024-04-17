import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
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
    on<Statusbuilder>(statusbuilder);
    on<Detailsbuilder>(detailsbuilder);
    on<Photobuilderedit>(photobuilderedit);
  }

  FutureOr<void> acCheckboxcCick(
      AcCheckboxcCick event, Emitter<AddvillaState> emit) {
    if (state is AcCheckboxcCickstate) {
      emit(AcCheckboxcCickedstate(istrue: true));
    } else {
      emit(AcCheckboxcCickstate(istrue: false));
    }
  }

  FutureOr<void> advillaInitial(
      AdvillaInitial event, Emitter<AddvillaState> emit) {
    if (event.istrue == true) {
      emit(AcCheckboxcCickedstate(istrue: event.istrue));
    } else {
      emit(AcCheckboxcCickstate(istrue: event.istrue));
    }
  }

  FutureOr<void> photobuilder(Photobuilder event, Emitter<AddvillaState> emit) {
    emit(Photobuilderstate());
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

  FutureOr<void> statusbuilder(
      Statusbuilder event, Emitter<AddvillaState> emit) {
    emit(StatusbuilderState());
  }

  FutureOr<void> detailsbuilder(
      Detailsbuilder event, Emitter<AddvillaState> emit) async {
    if (event.istrue) {
      emit(DetailsloadingState());

      await getvillas();
      await Future.delayed(const Duration(seconds: 1));
      emit(DetailsbuilderState());
    } else {
      emit(DetailsbuilderState());
    }
  }

  FutureOr<void> photobuilderedit(
      Photobuilderedit event, Emitter<AddvillaState> emit) {
    emit(Photobuildereditstate());
  }
}
