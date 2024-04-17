import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/drop_down.dart';
import 'package:kalliyath_villa_admin/categories/add_categories/add_categories.dart';
import 'package:kalliyath_villa_admin/firebase_get/function.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar.dart';

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
