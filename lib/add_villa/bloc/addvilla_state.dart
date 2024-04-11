part of 'addvilla_bloc.dart';

@immutable
sealed class AddvillaState {}

final class AddvillaInitial extends AddvillaState {}

class AcCheckboxcCickedstate extends AddvillaState {
 final bool istrue;
  AcCheckboxcCickedstate({required this.istrue});
}

class AcCheckboxcCickstate extends AddvillaState {
 final bool istrue;
  AcCheckboxcCickstate({required this.istrue});
}

class photobuilderstate extends AddvillaState {}

class Dropdownbuilderstate extends AddvillaState {}
class Lodingbuilderstate1 extends AddvillaState{}
class Lodingbuilderstate2 extends AddvillaState{}
class LocationbuilderState extends AddvillaState{}
