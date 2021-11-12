// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';

import 'package:image_picker/image_picker.dart';

import 'profile_edit.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();

  File? imageFile;
  File? imageFile1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GoBack.tx('Upload a image'),
        centerTitle: true,
        leading: GoBack.back(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Image Cropper',
            onPressed: () {
              GoBack.selectScreen(
                  context,
                  ProfileEdit(
                    imageFile: imageFile,
                  ));
              // imageFile == imageFile1? showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: GoBack.tx('Please choose a picture'),
              //     content: SingleChildScrollView(
              //       child: Column(
              //         children: [
              //           ListTile(
              //             // leading: const Icon(Icons.image),
              //             title: GoBack.tx('Ok'),
              //             onTap: () => Navigator.pop(context),
              //           ),
              //           // ListTile(
              //           //   leading: const Icon(Icons.camera),
              //           //   title: GoBack.tx('Camera'),
              //           //   onTap: () => _imageFromCamera(context),
              //           // ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ):print('');
            },
          ),
        ],
      ),
      body: Center(
        child: imageFile == imageFile1
            ? GoBack.tx('no image upload yet')
            : Image.file(
                imageFile!,
                width: 450,
                height: 450,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOption(context),
        child: const Icon(Icons.add_photo_alternate),
      ),
    );
  }

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: GoBack.tx('Make a choice'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: GoBack.tx('Gallery'),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: GoBack.tx('Camera'),
                onTap: () => _imageFromCamera(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      final imageTemorary = File(image!.path);
      if (image == null) {
        return;
      }
      setState(() {
        imageFile = imageTemorary;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _imageFromCamera(BuildContext context) async {
    try {
      // Capture a photo
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      final photoTemorary = File(photo!.path);
      if (photo == null) {
        return;
      }
      setState(() {
        imageFile = photoTemorary;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }
}
