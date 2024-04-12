import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/functions.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/onclick.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/drop_down.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/part_one.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/text_field.dart';
import 'package:kalliyath_villa_admin/add_villa/part_two.dart/pat_two.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';

bool acistrue = false;
addvilla(BuildContext context, Size size, Map<String, dynamic> details,
    bool istrue) {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AddvillaBloc villa = AddvillaBloc();
  villa.add(AdvillaInitial());
  if (villaCategories.isEmpty) {
    return checkCategory(context, size);
  } else {
    if (istrue) {
      villaNamecontroller.text = details['name'];
      villaDescriptioncontroller.text = details['description'];
      villaPricecontroller.text = details['price'];
      villaBhkcontroller.text = details['bhk'];
      selectedVilla = details['type'];
      location = details['location'];
      acistrue = details['ac'];
      acbloc.add(AcCheckboxcCick(istrue: details['ac']));
      villa.add(Locationbuilder());
      villa.add(Photobuilder());
    } else {
      villa.add(Photobuilder());
    }
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    istrue ? 'Edit Villa' : 'Add Villa',
                    style: const TextStyle(
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
                        PartOne(
                          size: size,
                          villa: villa,
                          formkey: formkey,
                          edit: istrue,
                        ),
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
                        firebaseimagedelete(imagesListupload);
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
                    color: const Color.fromARGB(35, 145, 143, 143),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(250, 12, 38, 77),
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "Kalliyath",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19),
                              ),
                            ),
                            CircularProgressIndicator(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ],
      );
    },
  );
}
