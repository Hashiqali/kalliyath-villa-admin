import 'package:flutter/material.dart';

snackbarAlert(context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.only(bottom: 60, left: 440, right: 440),
    content: Text(
      messege,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: "Kalliyath",
          fontWeight: FontWeight.w400,
          fontSize: 15),
    ),
  ));
}
