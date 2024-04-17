import 'dart:typed_data';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/part_one.dart/text_field.dart';

String villaname = villaNamecontroller.text.trim();
String description = villaDescriptioncontroller.text.trim();
String location = '';
Map<String, dynamic> locationaddress = {};
String type = '';
bool ac = false;
String price = villaPricecontroller.text.trim();
String bhk = villaBhkcontroller.text.trim();
bool wifi = false;
bool parking = false;
bool tv = false;
bool swimmingpool = false;
bool playground = false;
bool spa = false;
bool fitness = false;

Future<List> imagecontroller(List values) async {
  List result = [];
  for (Uint8List i in values) {
    String imageurl = await addimageTofirebase(i);
    result.add(imageurl);
  }
  return result;
}

List img = [];
Future<Map<String, dynamic>> getallvillasdetails(
    {List? imagesindatabase, required bool istrue, String? id}) async {
  if (istrue == true && imagesindatabase!.isNotEmpty) {
    final image2 = await imagecontroller(imagesupdate);
    image2.addAll(editchangeslist);
    image2.sort();
    img = image2;
  } else {
    img = await imagecontroller(imagesList);
  }

  final data = {
    'name': villaname,
    'description': description,
    'location': location,
    'locationadress': locationaddress,
    'type': type,
    'ac': ac,
    'status': true,
    'price': price,
    'bhk': bhk,
    'wifi': wifi,
    'parking': parking,
    'tv': tv,
    'swimmingpool': swimmingpool,
    'playground': playground,
    'spa': spa,
    'fitness': fitness,
    'images': img
  };
  return data;
}
