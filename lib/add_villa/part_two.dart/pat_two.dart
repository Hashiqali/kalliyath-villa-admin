import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/part_two.dart/check_box.dart';

class PartTwo extends StatelessWidget {
  const PartTwo({super.key, required this.size, required this.villa});
  final Size size;
  final AddvillaBloc villa;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: size.width / 2,
      height: size.height / 1.4,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '   Facilities',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 17,
              ),
            ),
            checkBox(villa: villa),
            SizedBox(height: size.height / 40),
            Material(
              elevation: 2,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: InkWell(
                  splashColor: const Color.fromARGB(52, 111, 111, 111),
                  onTap: () {},
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 15,
                      width: size.width / 15,
                      child: const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 19,
                            color: Color.fromARGB(255, 17, 107, 204),
                          ),
                          Text(
                            'Choose',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "Kalliyath",
                                fontSize: 12),
                          ),
                        ],
                      )))),
            ),
            SizedBox(height: size.height / 40),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: 40,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 164, 164, 163),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            size: 30,
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
