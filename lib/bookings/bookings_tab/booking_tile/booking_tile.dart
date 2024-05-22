import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/bookings/bloc/booking_bloc.dart';
import 'package:kalliyath_villa_admin/bookings/bookings_tab/booking_datas/booking_datas.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

BookingBloc bookingbloc = BookingBloc();
bookingTile({required Size size}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 2, right: 2),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ], color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: BlocBuilder<BookingBloc, BookingState>(
            bloc: bookingbloc,
            builder: (context, state) {
              return FutureBuilder<List>(
                future: getbookings(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                      height: 55,
                      width: 55,
                      child: CircularProgressIndicator(
                        color: AppColors.black,
                      ),
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final bookings = snapshot.data ?? [];
                    final booked = getbooked(bookings);
                    booked.sort((a, b) {
                      DateTime dateA = DateTime.parse(a['villa']['checkout']);
                      DateTime dateB = DateTime.parse(b['villa']['checkout']);
                      return dateB.compareTo(dateA); // For descending order
                    });

                    return booked.isEmpty
                        ? Center(
                            child: Text('No Bookings',
                                style: apptextstyle(
                                    color: AppColors.black, size: 16)),
                          )
                        : ListView.builder(
                            itemCount: booked.length,
                            itemBuilder: (ctx, index) {
                              final data = booked[index];

                              return bookingDatasTile(
                                  size: size,
                                  image: data['villa']['image'],
                                  name: data['address']['name'],
                                  orderid: data.id,
                                  context: context,
                                  totalamount:
                                      data['price']['total'].toString(),
                                  details: data);
                            });
                  }
                },
              );
            },
          ),
        ),
      ),
    ),
  );
}

getbooked(List values) {
  List result = [];
  for (var i in values) {
    if (i['cancelled'] != true) {
      result.add(i);
    }
  }
  return result;
}
