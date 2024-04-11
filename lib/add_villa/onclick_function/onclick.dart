import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/text_field.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
import 'package:kalliyath_villa_admin/widgets/snackbar.dart';

final CollectionReference firedata =
    FirebaseFirestore.instance.collection('VillaDetails');

formsubmit(GlobalKey<FormState> key, context, AddvillaBloc villa) async {
  bool istrue = villaDetails
      .any((element) => element['name'] == villaNamecontroller.text.trim());
  if (key.currentState!.validate()) {
    if (istrue) {
      snackbarAlert(context, 'Villa already exist');
      return;
    } else if (type == '') {
      snackbarAlert(context, 'Please select villa type');
      return;
    } else if (imagesList.length > 3) {
      snackbarAlert(context, 'Please add atleast 4 images');
    } else {
      villa.add(Lodingbuilder());
      final data = await getallvillasdetails();
      await firedata.add(data);
      snackbarAlert(context, 'Success');
      clearall();
      Navigator.of(context).pop();
    }
  } else {
    snackbarAlert(context, 'Please fill the form');
  }
}

clearall() {
  villaNamecontroller.text = '';
  villaDescriptioncontroller.text = '';
  villaBhkcontroller.text = '';
  villaPricecontroller.text = '';
  villaname = '';
  description = '';
  location = '';
  type = '';
  ac = false;
  price = '';
  bhk = '';
  wifi = false;
  parking = false;
  tv = false;
  swimmingpool = false;
  playground = false;
  spa = false;
  fitness = false;
  imagesList.clear();
}
