import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TableDatas extends StatelessWidget {
  TableDatas({super.key, required this.size});
  Size size;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: SizedBox(
                    height: size.height / 10,
                    width: size.width / 1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size.height / 15,
                              width: size.width / 25,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              color: Colors.amber,
                              height: size.height / 15,
                              width: size.width / 12,
                              child: const Center(
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Kalliyath",
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.amber,
                              height: size.height / 15,
                              width: size.width / 12,
                              child: const Center(
                                child: Text('Type',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Kalliyath",
                                        fontSize: 16)),
                              ),
                            ),
                            Container(
                              color: Colors.amber,
                              height: size.height / 15,
                              width: size.width / 15,
                              child: const Center(
                                child: Text('Price',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Kalliyath",
                                        fontSize: 16)),
                              ),
                            ),
                            Container(
                              height: size.height / 20,
                              width: size.width / 20,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 7, 209, 78),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Kalliyath"),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.amber,
                              height: size.height / 15,
                              width: size.width / 15,
                              child: const Center(
                                child: Text('Status',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Kalliyath",
                                        fontSize: 16)),
                              ),
                            ),
                            Container(
                              height: size.height / 20,
                              width: size.width / 20,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 102, 255),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Kalliyath"),
                                ),
                              ),
                            ),
                            Container(
                              height: size.height / 20,
                              width: size.width / 20,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: "Kalliyath"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
