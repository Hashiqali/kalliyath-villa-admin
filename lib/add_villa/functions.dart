import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/main_page/side_tile.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

pickLocation(BuildContext context, AddvillaBloc villa) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Location',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Kalliyath', color: Colors.black),
              ),
            ],
          ),
          content: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2.2,
              child: OpenStreetMapSearchAndPick(
                  buttonWidth: 130,
                  zoomInIcon: Icons.zoom_in_sharp,
                  zoomOutIcon: Icons.zoom_out,
                  locationPinIconColor: Colors.red,
                  locationPinTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontSize: 12),
                  buttonColor: const Color.fromARGB(255, 12, 38, 77),
                  buttonText: 'Pick Location',
                  buttonTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Kalliyath",
                      fontSize: 12),
                  onPicked: (pickedData) {
                    location = (pickedData.latLong.latitude).toString();
                    villa.add(Locationbuilder());
                    print({'address= ${pickedData.address}'});
                    Navigator.pop(context);
                  })),
          actions: [
            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 0, 0),
              child: InkWell(
                  splashColor: const Color.fromARGB(52, 97, 93, 93),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: MediaQuery.of(context).size.height / 18,
                      width: MediaQuery.of(context).size.width / 18,
                      child: const Center(
                          child: Text(
                        'Back',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "Kalliyath",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )))),
            ),
          ],
        );
      });
}

checkCategory(context, Size size) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(251, 255, 255, 255),
          content: SizedBox(
            height: size.height / 19,
            width: size.width / 3,
            child: const Text(
              'You need to create a category first !',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 5, 5),
                  fontFamily: "Kalliyath",
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            TextButton(
                onPressed: () {
                  indexx = 5;
                  currentidx = 5;
                  sidebarindex.add(Indexchange());
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'Create Category',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Kalliyath",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
          ],
        );
      });
}
