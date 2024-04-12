import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';

Widget selectVillatype() {
  AddvillaBloc bloc = AddvillaBloc();
  String selectedVilla = '';
  return BlocBuilder<AddvillaBloc, AddvillaState>(
    bloc: bloc,
    builder: (context, state) {
      if (state is Dropdownbuilderstate) {
        return SizedBox(
          child: SizedBox(
            width: 200, // Adjust the width as needed
            child: DropdownButton<String>(
              value: selectedVilla, // Current selected villa option
              hint: const Text(
                  'Select a Villa'), // Hint text when no option is selected
              onChanged: (String? newValue) {
                selectedVilla = newValue!; // Update selected villa option
                bloc.add(Dropdownbuilder()); // Notify bloc about the change
              },
              items: <String>[
                'Beachfront Villa',
                'Cliffside Villa',
                'Mountain Villa',
                'Lakefront Villa',
                'Island Villa'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
      return SizedBox(
        width: 20,
        height: 10,
        child: DropdownButton<String>(
          value: selectedVilla,
          hint: const Text('Select a Villa'),
          onChanged: (String? newValue) {
            selectedVilla = newValue!;
            bloc.add(Dropdownbuilder());
          },
          items: <String>[
            'Beachfront Villa',
            'Cliffside Villa',
            'Mountain Villa',
            'Lakefront Villa',
            'Island Villa'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: double.infinity,
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}
