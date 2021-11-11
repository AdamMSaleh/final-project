import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile_edit.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';


// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ImageCropper',
//       theme: ThemeData.light().copyWith(primaryColor: Colors.deepOrange),
//       home:  const ImageCropperPage(
//         title: 'ImageCropper',
//       ),
//     );
//   }
// }

class ImageCropperPage extends StatefulWidget {
  final String title;

   const ImageCropperPage({Key? key, required this.title}) : super(key: key);

  @override
  _ImageCropperPageState createState() => _ImageCropperPageState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ImageCropperPageState extends State<ImageCropperPage> {
  final ImagePicker _picker = ImagePicker();
  late AppState state;
  File? imageFile;
  File? imageFile1;
  Icon iconFloatingActionButton=const Icon(Icons.add);

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Image Cropper',
            onPressed: () {
              imageFile == imageFile1  ? _showOptionActionsAppBar( context,'Please choose a picture'):state == AppState.cropped?GoBack.selectScreen(context, ProfileEdit(imageFile: imageFile,)):_showOptionActionsAppBar( context,'Please Cropper a picture');
            },
          ),
        ],
      ),
      body: Center(
        child: imageFile != null ? Image.file(imageFile!) : Container(
          alignment: Alignment.center,
          child: const Text('No Image Upload Yet'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          try {
            if (state == AppState.free) {
              _showOption(context);
            } else if (state == AppState.picked) {
              _cropImage();
            } else if (state == AppState.cropped) {
              _clearImage();
            }
          } catch (e) {
            main();
          }
        },
        child: _buildButtonIcon(),
      ),
    );
  }

  Widget _buildButtonIcon() {
    try {
      if (state == AppState.free) {
        return const Icon(Icons.add);
      } else if (state == AppState.picked) {
        return const Icon(Icons.crop);
      } else if (state == AppState.cropped) {
        return const Icon(Icons.clear);
      } else {
        return Container(
          alignment: Alignment.center,
          child: const Text('No Image Upload Yet'),
        );
      }
    } catch (e) {
      main();
      return Container(
        alignment: Alignment.center,
        child: const Text('No Image Upload Yet'),
      );
    }
  }
/***********************************************************************/

  _showOptionActionsAppBar(BuildContext context,String str) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: GoBack.tx(str),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                // leading: const Icon(Icons.image),
                title: GoBack.tx('Ok'),
                onTap: () => Navigator.pop(context),
              ),

            ],
          ),
        ),
      ),
    );
  }

  /*----------------------------------------------------------------------------------*/

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

  /*----------------------------------------------------------------------------------*/

  Future _imageFromGallery(BuildContext context) async {
    try{
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      final imageTemorary = File(image!.path);
      if (image == null) {
        return;
      }
      setState(() {
        imageFile = imageTemorary;
        state = AppState.picked;
      });
      Navigator.pop(context);
    }on PlatformException catch (e){
      print("Failed to pick image : $e");
    }
  }
/*----------------------------------------------------------------------------------*/

  Future _imageFromCamera(BuildContext context) async {
    try{
      // Capture a photo
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      final photoTemorary = File(photo!.path);
      if (photo == null) {
        return;
      }
      setState(() {
        imageFile = photoTemorary;
        state = AppState.picked;
      });
      Navigator.pop(context);
    }on PlatformException catch (e){
      print("Failed to pick image : $e");
    }
  }

/***********************************************************************/
  // Future<void> _pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   imageFile = pickedImage != null ? File(pickedImage.path) : null;
  //   if (imageFile != null) {
  //     setState(() {
  //       state = AppState.picked;
  //     });
  //   }
  // }

  Future<void> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                /*هون عشان احدد مسنبة الاقتيطاع*/
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
          /*هاي عشان ما اقدر اتحكم
          في زويا الصورة و اعطيه ابعاد غير الي الزمته فيها
          */
        ),
        iosUiSettings: const IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }


}
