import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/text_field.dart';

// ignore: must_be_immutable
class PartOne extends StatelessWidget {
  PartOne({super.key, required this.size, required this.villa});

  Size size;
  AddvillaBloc villa;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TextFormWidget(size: size, villa: villa)],
        ),
      ),
    );
  }
}
