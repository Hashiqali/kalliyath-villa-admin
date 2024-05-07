import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa_admin/Categories/add_update_categories/add_update_categories.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/drop_down.dart';
import 'package:kalliyath_villa_admin/firebase/function.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar_widget/sidebar.dart';

initialfunctions() async {
  sidebarindex.add(Indexchange());
  await getvillas();
  await getcategories();
  blocCategories.add(CategoriesBuild());
  dropdownupdate.add(Dropdownbuilder());
  detailsbloc.add(Detailsbuilder(istrue: true));
}

getvillas() async {
  villaDetails.clear();
  villaDetails = await getFirebaseDetails('VillaDetails');
}

getcategories() async {
  villaCategories.clear();
  villaCategories = await getFirebaseDetails('Categories');
}

List<Map<String, dynamic>> villaCategories = [];
List<Map<String, dynamic>> villaDetails = [];

Future<List> getbookings() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Bookings').get();

    List villas = querySnapshot.docs..toList();

    return villas;
  } catch (e) {
    log('Error fetching villas: $e');
    return [];
  }
}

Future<List> getuser() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('signup').get();

    List villas = querySnapshot.docs..toList();

    return villas;
  } catch (e) {
    log('Error fetching villas: $e');
    return [];
  }
}
