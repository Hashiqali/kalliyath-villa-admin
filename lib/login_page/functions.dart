import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/main_page/main_page.dart';

login(context, formkey, usercontroller, passwordcontoller) async {
  if (formkey.currentState!.validate()) {
    if (usercontroller == 'admin' && passwordcontoller == '1234') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const MainPage()));
    }
  }
}
