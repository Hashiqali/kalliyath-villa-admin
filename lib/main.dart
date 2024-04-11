import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBva9NPfmr_KzBORjVdRWPhNdjP1MUk4Gk",
    authDomain: "kalliyath-villa-5fb57.firebaseapp.com",
    projectId: "kalliyath-villa-5fb57",
    storageBucket: "kalliyath-villa-5fb57.appspot.com",
    messagingSenderId: "375481856635",
    appId: "1:375481856635:web:f3e87e46ff04a3ad03a8de",
  );

  await Firebase.initializeApp(options: firebaseConfig);

  await initialfunctions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}