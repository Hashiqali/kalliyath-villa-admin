import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/onclick.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/part_one.dart';
import 'package:kalliyath_villa_admin/add_villa/part_two.dart/pat_two.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';

addvilla(BuildContext context, Size size) {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AddvillaBloc villa = AddvillaBloc();
  villa.add(AdvillaInitial());
  if (villaCategories.isEmpty) {
    return checkCategory(context, size);
  } else {
    villa.add(Photobuilder());
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Villa',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Kalliyath',
                        color: Colors.black),
                  ),
                ],
              ),
              content: SizedBox(
                  width: size.width / 1.2,
                  height: size.height / 1.2,
                  child: Form(
                    key: formkey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PartOne(size: size, villa: villa, formkey: formkey),
                        PartTwo(
                          size: size,
                          villa: villa,
                        )
                      ],
                    ),
                  )),
              actions: [
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 0, 0),
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 97, 93, 93),
                      onTap: () {
                        Navigator.of(context).pop();
                        clearall();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 15,
                          child: const Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )))),
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 12, 38, 77),
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 97, 93, 93),
                      onTap: () async {
                        formsubmit(formkey, context, villa);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 15,
                          child: const Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )))),
                )
              ],
            ),
          ),
          BlocBuilder<AddvillaBloc, AddvillaState>(
            bloc: villa,
            builder: (context, state) {
              bool istrue = false;
              if (state is Lodingbuilderstate1) {
                istrue = true;
              } else if (state is Lodingbuilderstate2) {
                istrue = false;
              }

              return Visibility(
                  visible: istrue,
                  child: Container(
                    color: const Color.fromARGB(36, 0, 0, 0),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(186, 186, 186, 185),
                            borderRadius: BorderRadius.circular(15)),
                        height: 200,
                        width: 300,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Please wait',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: "Kalliyath",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          )
        ],
      );
    },
  );
}