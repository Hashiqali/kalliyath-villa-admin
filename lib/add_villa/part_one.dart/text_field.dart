import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/drop_down.dart';

final TextEditingController villaNamecontroller = TextEditingController();
final TextEditingController villaDescriptioncontroller =
    TextEditingController();
final TextEditingController villaPricecontroller = TextEditingController();
final TextEditingController villaBhkcontroller = TextEditingController();
AddvillaBloc acbloc = AddvillaBloc();

class TextFormWidget extends StatefulWidget {
  const TextFormWidget(
      {super.key,
      required this.size,
      required this.villa,
      required this.formkey,
      required this.edit});
  final Size size;
  final AddvillaBloc villa;
  final GlobalKey formkey;
  final bool edit;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  void initState() {
    if (!widget.edit) {
      acbloc.add(AcCheckboxcCick(istrue: false));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: villaNamecontroller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Villa Name';
            } else if (value.length < 4) {
              return 'Name should be atleast 4 character';
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 240, 238, 238),
            labelText: 'Name of Villa',
            labelStyle: const TextStyle(
                fontSize: 13, fontFamily: 'Kalliyath', color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: widget.size.height / 40),
        SizedBox(
          height: widget.size.height / 5,
          child: TextFormField(
            controller: villaDescriptioncontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Description';
              } else if (value.length < 30) {
                return 'Description must be atleast 30 characters long.';
              }

              return null;
            },
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 240, 238, 238),
              labelText: 'Description',
              labelStyle: const TextStyle(
                  fontSize: 13, fontFamily: 'Kalliyath', color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: widget.size.height / 40),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            '  Choose Location',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 12),
          ),
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: widget.villa,
          builder: (context, state) {
            if (state is LocationbuilderState) {
              print('location rebuilded');
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: InkWell(
                        splashColor: const Color.fromARGB(52, 111, 111, 111),
                        onTap: () async {
                          pickLocation(context, widget.villa);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            height: widget.size.height / 15,
                            width: widget.size.width / 15,
                            child: const Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.done,
                                  size: 17,
                                  color: Color.fromARGB(255, 36, 224, 3),
                                ),
                                Text(
                                  'Done',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: "Kalliyath",
                                      fontSize: 12),
                                ),
                              ],
                            )))),
                  ),
                  dropdownWidget(size: widget.size)
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  elevation: 3,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 111, 111, 111),
                      onTap: () async {
                        pickLocation(context, widget.villa);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: widget.size.height / 15,
                          width: widget.size.width / 15,
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 17,
                                color: Color.fromARGB(255, 224, 136, 3),
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
                dropdownWidget(size: widget.size)
              ],
            );
          },
        ),
        SizedBox(height: widget.size.height / 40),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: acbloc,
          builder: (context, state) {
            bool istrue = acistrue;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return Row(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'A/c',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Kalliyath",
                            fontSize: 17),
                      ),
                    ),
                    Checkbox(
                        checkColor: const Color.fromARGB(255, 255, 255, 255),
                        fillColor: const MaterialStatePropertyAll(Colors.black),
                        value: istrue == true,
                        onChanged: (value) {
                          ac = value!;

                          acbloc.add(AcCheckboxcCick(istrue: true));
                        }),
                  ],
                ),
                SizedBox(width: widget.size.height / 20),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Non A/c',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Kalliyath",
                            fontSize: 17),
                      ),
                    ),
                    Checkbox(
                        checkColor: const Color.fromARGB(255, 255, 255, 255),
                        fillColor: const MaterialStatePropertyAll(Colors.black),
                        value: istrue == false,
                        onChanged: (value) {
                          ac = false;

                          acbloc.add(AcCheckboxcCick(istrue: false));
                        }),
                  ],
                )
              ],
            );
          },
        ),
        SizedBox(height: widget.size.height / 40),
        Row(
          children: [
            SizedBox(
              width: widget.size.width / 7,
              child: TextFormField(
                controller: villaPricecontroller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Price';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 240, 238, 238),
                  prefixIcon: const Icon(
                    Icons.currency_rupee,
                    size: 18,
                  ),
                  suffixText: '/ Day',
                  suffixStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Kalliyath',
                      color: Colors.black),
                  labelText: 'Price per day',
                  labelStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Kalliyath',
                      color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: widget.size.height / 40),
            SizedBox(
              width: widget.size.width / 7,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                ],
                controller: villaBhkcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter BHK';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 240, 238, 238),
                  suffixText: 'BHK',
                  suffixStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Kalliyath',
                      color: Colors.black),
                  labelText: 'BHK',
                  labelStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Kalliyath',
                      color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
