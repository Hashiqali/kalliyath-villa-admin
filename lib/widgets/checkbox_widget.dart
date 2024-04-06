import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';

checkboxwidget(
    {required String text,
    required Function function,
    required AddvillaBloc bloc}) {
  return BlocBuilder<AddvillaBloc, AddvillaState>(
    bloc: bloc,
    builder: (context, state) {
      bool istrue = false;
      if (state is AcCheckboxcCickedstate) {
        istrue = true;
      } else if (state is AcCheckboxcCickstate) {
        istrue = false;
      }
      return CheckboxListTile(
        title: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "Kalliyath",
            fontSize: 13,
          ),
        ),
        activeColor: Colors.black,
        value: istrue,
        onChanged: (value) {
          function(value);
        },
      );
    },
  );
}
