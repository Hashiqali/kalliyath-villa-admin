import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/firebase_get/firebase_get.dart';
import 'package:kalliyath_villa_admin/villas/table/functions.dart';

final AddvillaBloc detailsbloc = AddvillaBloc();

// ignore: must_be_immutable
class TableDatas extends StatelessWidget {
  TableDatas({super.key, required this.size});
  Size size;
  String selectedvalue = 'Active';
  final AddvillaBloc statusbloc = AddvillaBloc();
  final CollectionReference firebaseCollection =
      FirebaseFirestore.instance.collection('VillaDetails');
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
          child: BlocBuilder<AddvillaBloc, AddvillaState>(
            bloc: detailsbloc,
            builder: (context, state) {
              if (state is DetailsloadingState) {
                return Container(
                    color: const Color.fromARGB(35, 145, 143, 143),
                    height: double.infinity,
                    width: double.infinity,
                    child: const Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(250, 12, 38, 77))));
              } else if (state is DetailsbuilderState) {
                return villaDetails.isEmpty
                    ? const Center(
                        child: Text(
                          'No datas',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Kalliyath",
                              fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: villaDetails.length,
                        itemBuilder: (ctx, index) {
                          final details = villaDetails[index];
                          final image = details['images'];
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 52, right: 50),
                            child: SizedBox(
                              height: size.height / 10,
                              width: size.width / 1.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: size.height / 15,
                                        width: size.width / 25,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(image[0])),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: size.height / 15,
                                        width: size.width / 12,
                                        child: Center(
                                          child: Text(
                                            details['name'],
                                            style: const TextStyle(
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
                                        child: Center(
                                          child: Text(details['type'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Kalliyath",
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: size.height / 15,
                                        width: size.width / 15,
                                        child: Center(
                                          child: Text('${details['price']}/Day',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Kalliyath",
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Container(
                                        height: size.height / 20,
                                        width: size.width / 20,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 7, 209, 78),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Kalliyath"),
                                          ),
                                        ),
                                      ),
                                      BlocBuilder<AddvillaBloc, AddvillaState>(
                                        bloc: statusbloc,
                                        builder: (context, state) {
                                          return SizedBox(
                                            height: size.height / 15,
                                            width: size.width / 12,
                                            child: DropdownButton<String>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              autofocus: false,
                                              underline: Container(),
                                              alignment: Alignment.center,
                                              value: selectedvalue,
                                              hint: const Text(
                                                'Change Status',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontFamily: "Kalliyath",
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onChanged: (String? newValue) {
                                                selectedvalue = newValue!;
                                                firebaseCollection
                                                    .doc(details['id'])
                                                    .update({
                                                  'status': newValue == 'Active'
                                                      ? true
                                                      : false
                                                });
                                                statusbloc.add(Statusbuilder());
                                              },
                                              items: <String>[
                                                'Active',
                                                'Blocked'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      color: value == 'Active'
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 40, 214, 5)
                                                          : Colors.red,
                                                      fontFamily: "Kalliyath",
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          addvilla(context, size, details,true);
                                        },
                                        child: Container(
                                          height: size.height / 20,
                                          width: size.width / 20,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 0, 102, 255),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Kalliyath"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          aletdilagueDelete(
                                              context: context,
                                              size: size,
                                              firebase: firebaseCollection,
                                              details: details);
                                        },
                                        child: Container(
                                          height: size.height / 20,
                                          width: size.width / 20,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontFamily: "Kalliyath"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
