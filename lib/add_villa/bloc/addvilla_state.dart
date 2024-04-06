part of 'addvilla_bloc.dart';

@immutable
sealed class AddvillaState {}

final class AddvillaInitial extends AddvillaState {}

class AcCheckboxcCickedstate extends AddvillaState {
  bool istrue;
  AcCheckboxcCickedstate({required this.istrue});
}

class AcCheckboxcCickstate extends AddvillaState {
  bool istrue;
  AcCheckboxcCickstate({required this.istrue});
}
