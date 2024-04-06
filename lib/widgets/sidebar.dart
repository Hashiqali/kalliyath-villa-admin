import 'package:adaptive_navigation_widget/adaptive_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';

MainPageBloc bloc1 = MainPageBloc();
Widget sidebar({
  required height,
  required width,
  required Widget icon,
  required Widget icon2,
  required Function ontap,
  required bool istrue,
  required name,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: Padding(
        padding: const EdgeInsets.all(10),
        child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: InkWell(
              splashColor: const Color.fromARGB(121, 0, 0, 0),
              onTap: () {
                ontap();
              },
              child: istrue
                  ? Container(
                      decoration: BoxDecoration(
                          color:  const Color.fromARGB(244, 7, 22, 45),
                          borderRadius: BorderRadius.circular(8)),
                      height: height / 15,
                      width: width / 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: ListTile(
                            leading: icon2,
                            title: Text(
                              name,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "Kalliyath",
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ))
                  : Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: height / 15,
                      width: width / 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: ListTile(
                            leading: icon,
                            title: Text(
                              name,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Kalliyath",
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ))),
        )),
  );
}

final List<AdaptiveDestination> destinations = [
  const AdaptiveDestination(
    initialPath: "/home",
    icon: Icon(
      Icons.home_outlined,
      color: Colors.black,
    ),
    selectedIcon: Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)),
    label: "Dashboard",
    tooltip: "Dashboard",
  ),
  const AdaptiveDestination(
    initialPath: "/feed",
    icon: Icon(Icons.villa_outlined, color: Colors.black),
    selectedIcon: Icon(Icons.villa, color: Color.fromARGB(255, 255, 255, 255)),
    label: "Villas",
    tooltip: "Villas",
  ),
  const AdaptiveDestination(
    initialPath: "/booking",
    icon: Icon(Icons.luggage_outlined, color: Colors.black),
    selectedIcon:
        Icon(Icons.luggage_rounded, color: Color.fromARGB(255, 255, 255, 255)),
    label: 'booking',
  ),
  const AdaptiveDestination(
    initialPath: "/profile",
    icon: Icon(Icons.person_outlined, color: Colors.black),
    selectedIcon: Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
    label: "User",
    tooltip: "User",
  ),
  const AdaptiveDestination(
    initialPath: "/Revenue",
    icon: Icon(Icons.currency_rupee_outlined, color: Colors.black),
    selectedIcon:
        Icon(Icons.currency_rupee, color: Color.fromARGB(255, 255, 255, 255)),
    label: 'Revenue',
    tooltip: 'Revenue',
  ),
];
