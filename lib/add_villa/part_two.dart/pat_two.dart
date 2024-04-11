import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/part_two.dart/check_box.dart';

class PartTwo extends StatelessWidget {
  const PartTwo({
    super.key,
    required this.size,
    required this.villa,
  });
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
                  onTap: () async {
                    filepicker(villa, context);
                  },
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
            const Padding(
              padding: EdgeInsets.only(
                left: 3,
                top: 10,
              ),
              child: Text(
                'Minimum 4 images required',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Kalliyath",
                    fontSize: 10),
              ),
            ),
            SizedBox(height: size.height / 40),
            Expanded(
              child: BlocBuilder<AddvillaBloc, AddvillaState>(
                bloc: villa,
                builder: (context, state) {
                  if (state is photobuilderstate) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                      itemCount: imagesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = imagesList[index];

                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: MemoryImage(data)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      imagesList.removeAt(index);
                                      villa.add(Photobuilder());
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 20,
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
