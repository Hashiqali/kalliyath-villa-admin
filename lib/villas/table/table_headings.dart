import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';



class TableItems extends StatelessWidget {
  TableItems({super.key, required this.size});
  Size size;
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
                  addvilla(context, size);
                  
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Image',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Type',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'View Details',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Status',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Kalliyath",
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
