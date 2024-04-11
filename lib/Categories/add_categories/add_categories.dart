import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/widgets/snackbar.dart';

TextEditingController _categoriescontroller = TextEditingController();
GlobalKey<FormState> _categorykey = GlobalKey<FormState>();
final CollectionReference _category =
    FirebaseFirestore.instance.collection('Categories');
MainPageBloc blocCategories = MainPageBloc();
addcategories(
    {required Size size,
    required BuildContext context,
    required bool istrue,
    String? text,
    String? id,
  }) {
  if (istrue) {
    _categoriescontroller.text = text!;
  }
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                istrue ? "Edit Category" : 'Add Category',
                style: const TextStyle(
                    fontSize: 20, fontFamily: 'Kalliyath', color: Colors.black),
              ),
            ],
          ),
          content: SizedBox(
            width: size.width / 3,
            height: size.height / 12,
            child: Form(
              key: _categorykey,
              child: TextFormField(
                controller: _categoriescontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Category';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 240, 238, 238),
                  labelText: 'Category',
                  labelStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Kalliyath',
                      color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 0, 0),
              child: InkWell(
                  splashColor: const Color.fromARGB(52, 97, 93, 93),
                  onTap: () async {
                    Navigator.of(context).pop();
                    await Future.delayed(const Duration(milliseconds: 500));
                    _categoriescontroller.text = '';
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 20,
                      width: size.width / 20,
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
                  onTap: () {
                    categorysubmit(context, istrue, id);
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 20,
                      width: size.width / 20,
                      child: Center(
                          child: Text(
                        istrue ? "Update" : 'Submit',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "Kalliyath",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )))),
            )
          ],
        );
      });
}

categorysubmit(context, bool update, id) {
  final name = _categoriescontroller.text.trim();
  if (update) {
    if (_categorykey.currentState!.validate()) {
      final istrue = villaCategories.any(
          (element) => element['category'].toLowerCase() == name.toLowerCase());
      if (!istrue) {
        blocCategories.add(LoadingCircular());
        _category.doc(id).update({'category': name});
        _categoriescontroller.text = '';
        blocCategories.add(CategoriesBuild());
        Navigator.of(context).pop();
        snackbarAlert(context, 'Updated');
      } else {
        snackbarAlert(context, 'Category already exist');
      }
    } else {
      snackbarAlert(context, 'Please Enter Category');
    }
  } else {
    if (_categorykey.currentState!.validate()) {
      final istrue = villaCategories.any(
          (element) => element['category'].toLowerCase() == name.toLowerCase());
      if (!istrue) {
        _category.add({'category': name});
        _categoriescontroller.text = '';
        blocCategories.add(CategoriesBuild());
        Navigator.of(context).pop();
        snackbarAlert(context, 'Success');
      } else {
        snackbarAlert(context, 'Category already exist');
      }
    } else {
      snackbarAlert(context, 'Please Enter Category');
    }
  }
}
