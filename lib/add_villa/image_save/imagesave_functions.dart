import 'dart:async';
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';

List<Uint8List> imagesList = [];
Future<void> filepicker(AddvillaBloc villa, context) async {
  try {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img1 != null) {
      final ImageCropper imageCropper = ImageCropper();

      final croppedFile = await imageCropper.cropImage(
        uiSettings: [
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 500,
              height: 400,
            ),
            viewPort: const CroppieViewPort(height: 300, width: 400),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
        sourcePath: img1.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
      );

      if (croppedFile != null) {
        final bytes = await croppedFile.readAsBytes();

        imagesList.add(bytes);
        villa.add(Photobuilder());
      }
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<String> addimageTofirebase(Uint8List? result) async {
  String imageUrl = '';
  if (result != null) {
    final bytes = result;

    try {
      final fileName = 'image-${DateTime.now().millisecondsSinceEpoch}.jpg';
      final referenceRoot = FirebaseStorage.instance.ref();
      final referenceDireFiles = referenceRoot.child('files');
      final referenceFileToUpload = referenceDireFiles.child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await referenceFileToUpload.putData(bytes, metadata);
      imageUrl = await referenceFileToUpload.getDownloadURL();
      print('File uploaded successfully. Download URL: $imageUrl');
    } catch (error) {
      print('Error uploading file: $error');
    }
  } else {
    print('No image data provided.');
  }
  return imageUrl;
}

// addimageTofirebase(Uint8List? result) async {
//   String imageUrl = '';
//   if (result != null) {
//     final bytes = result;

//     try {
   
//       final fileName = 'image-${DateTime.now().millisecondsSinceEpoch}_$result';
//       final referenceRoot = FirebaseStorage.instance.ref();
//       final referenceDireFiles = referenceRoot.child('files');
//       final referenceFileToUpload = referenceDireFiles.child(fileName);
//       final metadata = SettableMetadata(contentType: 'image/jpeg');
//       await referenceFileToUpload.putData(bytes, metadata);
//       imageUrl = await referenceFileToUpload.getDownloadURL();
//       print('File uploaded successfully. Download URL: $imageUrl');
//     } catch (error) {
//       log('Error uploading file: ${error.toString()}');
//     }
//   }
// }
