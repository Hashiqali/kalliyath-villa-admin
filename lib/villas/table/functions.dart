import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';

aletdilagueDelete(
    {required context,
    required Size size,
    required CollectionReference firebase,
    required Map<String, dynamic> details}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(251, 255, 255, 255),
          content: SizedBox(
            height: size.height / 19,
            width: size.width / 3,
            child: const Text(
              'Are you sure you want to delete this villa?',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 5, 5),
                  fontFamily: "Kalliyath",
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  detailsbloc.add(Detailsbuilder());
                  Navigator.pop(context);
                  await firebase.doc(details['id']).delete();
                  await firebaseimagedelete(details['images']);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
          ],
        );
      });
}
