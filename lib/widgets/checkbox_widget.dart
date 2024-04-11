import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.istrue,
      required this.ontap,
      required this.text});
  final Function ontap;
  final bool istrue;
  final String text;
  @override
  Widget build(BuildContext context) {
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
        ontap(value);
      },
    );
  }
}
