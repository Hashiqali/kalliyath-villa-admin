import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/part_one.dart';
import 'package:kalliyath_villa_admin/add_villa/part_two.dart/pat_two.dart';

addvilla(context, Size size) {
  AddvillaBloc villa = AddvillaBloc();
  villa.add(AdvillaInitial());
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Villa',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Kalliyath', color: Colors.black),
              ),
            ],
          ),
          content: SizedBox(
              width: size.width / 1.2,
              height: size.height / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PartOne(size: size, villa: villa),
                  PartTwo(
                    size: size,
                    villa: villa,
                  )
                ],
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
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 15,
                      width: size.width / 15,
                      child: const Center(
                          child: Text(
                        'No',
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
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 15,
                      width: size.width / 15,
                      child: const Center(
                          child: Text(
                        'Yes',
                        style: TextStyle(
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
