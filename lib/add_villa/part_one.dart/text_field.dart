import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';


class TextFormWidget extends StatelessWidget {
 const TextFormWidget({super.key, required this.size, required this.villa});
 final Size size;
  final  AddvillaBloc villa;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
        SizedBox(height: size.height / 40),
        SizedBox(
          height: size.height / 5,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Description';
              } else if (value.split(' ').length < 10) {
                return 'Description must contain at least 10 words';
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
        SizedBox(height: size.height / 40),
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
        Row(
          children: [
            Material(
              elevation: 3,
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
          ],
        ),
        SizedBox(height: size.height / 40),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: villa,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = true;
            } else if (state is AcCheckboxcCickstate) {
              istrue = false;
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
                          villa.add(AcCheckboxcCick(istrue: true));
                        }),
                  ],
                ),
                SizedBox(width: size.height / 20),
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
                          villa.add(AcCheckboxcCick(istrue: false));
                        }),
                  ],
                )
              ],
            );
          },
        ),
        SizedBox(height: size.height / 40),
        Row(
          children: [
            SizedBox(
              width: size.width / 7,
              child: TextFormField(
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
            SizedBox(width: size.height / 40),
            SizedBox(
              width: size.width / 7,
              child: TextFormField(
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
