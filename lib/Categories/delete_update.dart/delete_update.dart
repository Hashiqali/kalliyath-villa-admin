import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/categories/add_categories/add_categories.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';

deleteCategory(context, id, categories, Size size, categoryloading) {
  showDialog(
      context: context,
      builder: (ctx) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            backgroundColor: const Color.fromARGB(251, 255, 255, 255),
            content: SizedBox(
              height: size.height / 19,
              width: size.width / 3,
              child: const Text(
                'Are you sure you want to delete this category?',
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
                    Navigator.pop(context);
                    categoryloading.add(LoadingCircular());
                    await categories.doc(id).delete();
                    blocCategories.add(CategoriesBuild());
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
          ),
        );
      });
}
