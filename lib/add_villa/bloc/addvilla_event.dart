part of 'addvilla_bloc.dart';

@immutable
sealed class AddvillaEvent {}

class AcCheckboxcCick extends AddvillaEvent {
  final bool istrue;

  AcCheckboxcCick({required this.istrue});
}

class AdvillaInitial extends AddvillaEvent{}

class Photobuilder extends AddvillaEvent{}

class Dropdownbuilder extends AddvillaEvent{}

class Lodingbuilder extends AddvillaEvent{}
class Locationbuilder extends AddvillaEvent{}


