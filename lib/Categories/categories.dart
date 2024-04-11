import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/Categories/delete_update.dart/delete_update.dart';
import 'package:kalliyath_villa_admin/categories/add_categories/add_categories.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';

class Categoriespage extends StatelessWidget {
  Categoriespage({super.key});
  final CollectionReference categories =
      FirebaseFirestore.instance.collection('Categories');
  final MainPageBloc categoryloading = MainPageBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 12, 38, 77),
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 97, 93, 93),
                      onTap: () {
                        addcategories(
                            size: size, context: context, istrue: false);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 10,
                          child: const Center(
                              child: Text(
                            'Add Categories',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )))),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: BlocBuilder<MainPageBloc, MainPageState>(
                  bloc: blocCategories,
                  builder: (context, state) {
                    if (state is LoadingCircularState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else if (state is CategoriesBuildState) {
                      print('=====rebuilded=====');
                      return villaCategories.isEmpty
                          ? const Center(
                              child: Text(
                                'No Categories',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: "Kalliyath",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 4.5,
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: villaCategories.length,
                              itemBuilder: (BuildContext context, int index) {
                                final category =
                                    villaCategories[index]['category'];
                                final id = villaCategories[index]['id'];
                                return Container(
                                    decoration: BoxDecoration(
                                      border: const Border.fromBorderSide(
                                          BorderSide(color: Colors.black)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              category,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontFamily: "Kalliyath",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              addcategories(
                                                size: size,
                                                context: context,
                                                istrue: true,
                                                text: category,
                                                id: id,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 58, 58, 57),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              deleteCategory(
                                                  context,
                                                  id,
                                                  categories,
                                                  size,
                                                  blocCategories);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            );
                    }
                    return const Center(
                      child: Text(
                        'No Categories',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Kalliyath",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
