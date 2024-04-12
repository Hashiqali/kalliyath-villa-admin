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

// Future<List<String>> imagecontroller(List values) async {
//   List<String> result = [];
//   for (var i in values) {
//     String imageurl = await addimageTofirebase(i);
//     result.add(imageurl);
//   }
//   return result;
// }

Future<Map<String, dynamic>> getallvillasdetails() async {
  // List<String> img = [];
  // img = await imagecontroller(imagesList);
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
    'images': imagesListupload
  };
  return data;
}
