import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<Indexchange>(indexchange);
    on<AddvillaPageChange>(addvillaPageChange);
  }

  FutureOr<void> indexchange(Indexchange event, Emitter<MainPageState> emit) {
    emit(Indexstate());
  }

  FutureOr<void> addvillaPageChange(
      AddvillaPageChange event, Emitter<MainPageState> emit) {
    if (state is! AddvillaPageChangeState && state is! VillasChangeState) {
      emit(VillasChangeState());
      emit(Indexstate());
    } else if (state is AddvillaPageChangeState) {
      emit(VillasChangeState());
      emit(Indexstate());
    } else {
      emit(AddvillaPageChangeState());
      emit(Indexstate());
    }
  }
}
