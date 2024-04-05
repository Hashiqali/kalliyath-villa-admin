import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<Indexchange>(indexchange);
  }
  int index = 0;
  FutureOr<void> indexchange(Indexchange event, Emitter<MainPageState> emit) {
    emit(Indexstate());
  }
}
