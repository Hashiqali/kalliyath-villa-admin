import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';

checkBox({required AddvillaBloc villa}) {
  AddvillaBloc blc1 = AddvillaBloc();
  AddvillaBloc blc2 = AddvillaBloc();
  AddvillaBloc blc3 = AddvillaBloc();
  AddvillaBloc blc4 = AddvillaBloc();
  AddvillaBloc blc5 = AddvillaBloc();
  AddvillaBloc blc6 = AddvillaBloc();
  blc1.add(AdvillaInitial());
  blc2.add(AdvillaInitial());
  blc3.add(AdvillaInitial());
  blc4.add(AdvillaInitial());
  blc5.add(AdvillaInitial());
  blc6.add(AdvillaInitial());
  return Column(
    children: [
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: villa,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Wifi',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              villa.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc1,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Parking',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc1.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc2,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Tv',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc2.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc3,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Swimming Pool',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc3.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc4,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Play Ground',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc4.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc5,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Spa fecilities',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc5.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
      BlocBuilder<AddvillaBloc, AddvillaState>(
        bloc: blc6,
        builder: (context, state) {
          bool istrue = false;
          if (state is AcCheckboxcCickedstate) {
            istrue = true;
          } else if (state is AcCheckboxcCickstate) {
            istrue = false;
          }
          return CheckboxListTile(
            title: const Text(
              'Fitness Center',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Kalliyath",
                fontSize: 13,
              ),
            ),
            activeColor: Colors.black,
            value: istrue,
            onChanged: (value) {
              blc6.add(AcCheckboxcCick(istrue: false));
            },
          );
        },
      ),
    ],
  );
}
