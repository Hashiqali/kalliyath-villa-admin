import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';

AddvillaBloc dropdownupdate = AddvillaBloc();
dropdownWidget({required Size size}) {
  String? selectedVilla;
  return Padding(
    padding: const EdgeInsets.only(right: 150),
    child: BlocBuilder<AddvillaBloc, AddvillaState>(
      bloc: dropdownupdate,
      builder: (context, state) {
        if (state is Dropdownbuilderstate) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: size.height / 15,
            width: size.width / 6,
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.only(left: 63, top: 5),
              autofocus: false,
              underline: Container(),
              alignment: Alignment.center,
              value: selectedVilla,
              hint: const Text(
                'Select Villa type',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Kalliyath",
                  fontSize: 15,
                ),
              ),
              onChanged: (String? newValue) {
                selectedVilla = newValue;
                type = newValue!;
                dropdownupdate.add(Dropdownbuilder());
              },
              items: getdropdownvalues()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return Container();
      },
    ),
  );
}

List<String> getdropdownvalues() {
  List<String> result = [];
  for (var i in villaCategories) {
    result.add(i['category']);
  }
  print(result);
  return result;
}
