import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';

class TableItems extends StatelessWidget {
  const TableItems({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 13),
              child: Text('Villas',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Kalliyath',
                      fontSize: 25)),
            ),
            Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromARGB(121, 129, 128, 128),
                onTap: () {
                  addvilla(context, size, {}, false);
                },
                child: Container(
                  height: size.height / 15,
                  width: size.width / 10,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(244, 7, 22, 45),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Add Villa',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kalliyath",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 50,
        ),
        Container(
          height: size.height / 10,
          width: size.width / 1.2,
          decoration: BoxDecoration(
              color: const Color.fromARGB(244, 7, 22, 45),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 52, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 25,
                        child: const Center(
                          child: Text(
                            'Image',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 20,
                        child: const Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 9,
                        child: const Center(
                          child: Text(
                            'Type',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: SizedBox(
                          height: size.height / 15,
                          width: size.width / 40,
                          child: const Center(
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "Kalliyath",
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: SizedBox(
                          height: size.height / 20,
                          width: size.width / 20,
                          child: const Center(
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "Kalliyath",
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 12,
                        child: const Center(
                          child: Text(
                            'Status',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                        width: size.width / 20,
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                        width: size.width / 20,
                        child: const Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Kalliyath",
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
