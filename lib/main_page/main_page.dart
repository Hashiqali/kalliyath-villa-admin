import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/categories/add_categories/add_categories.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/main_page/side_tile.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: SideTile(size: size));
  }
}
