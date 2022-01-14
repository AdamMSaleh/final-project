// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:image_picker/image_picker.dart';

import 'image_list.dart';
import 'view_image.dart';

// main() => runApp(const Call5());

// class Call5 extends StatelessWidget {
//   const Call5({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.amber),
//       home: const UploadImage(),
//     );
//   }
// }

class UploadImageInvoice extends StatefulWidget {
  const UploadImageInvoice({Key? key}) : super(key: key);
  static const String id = 'UploadImageInvoice';

  @override
  _UploadImageInvoiceState createState() => _UploadImageInvoiceState();
}

class _UploadImageInvoiceState extends State<UploadImageInvoice> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  File? imageFile1;
  List<Image1> uImage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحميل صورة فاتورة'),
        centerTitle: true,
        // leading: GoBack.back(context),
        // actions: [
        //   // IconButton(
        //   //   icon: const Icon(Icons.arrow_forward),
        //   //   tooltip: 'Image Cropper',
        //   //   onPressed: () {
        //   //     // GoBack.selectScreen(context, ProfileEdit(imageFile: imageFile,));
        //   //     imageFile == imageFile1
        //   //         ? showDialog(
        //   //             context: context,
        //   //             builder: (context) => AlertDialog(
        //   //               title: const Text('اختر صورة'),
        //   //               content: SingleChildScrollView(
        //   //                 child: Column(
        //   //                   children: [
        //   //                     ListTile(
        //   //                       // leading: const Icon(Icons.image),
        //   //                       title: const Text('تم'),
        //   //                       onTap: () => Navigator.pop(context),
        //   //                     ),
        //   //                     // ListTile(
        //   //                     //   leading: const Icon(Icons.camera),
        //   //                     //   title: GoBack.tx('Camera'),
        //   //                     //   onTap: () => _imageFromCamera(context),
        //   //                     // ),
        //   //                   ],
        //   //                 ),
        //   //               ),
        //   //             ),
        //   //           )
        //   //         : print('');
        //   //   },
        //   // ),
        // ],
      ),
      body: Center(
        child: imageFile == null
            ? const Text('لا يوجد صور محملة حالياً')
            : ClipRRect(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  //نسبت العرض لطول
                  crossAxisSpacing: 15,
                  //الفرافات بين العناصر
                  children: [
                    ...uImage.map((e) {
                      return InkWell(
                        onTap: () => selectScreen(context, ViewImage(e.imagee)),
                        child: ClipRRect(
                          child: Container(
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.greenAccent,
                                  Colors.indigoAccent.withOpacity(0.1)
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            // color: Colors.blueGrey,
                            child: Image.file(
                              e.imagee,
                              height: 250,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: project_color('741b47'),
        onPressed: () => _showOption(context),
        child: Icon(Icons.add_photo_alternate),
      ),
    );
  }

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(' : اختر واحدة '),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('المعرض'),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('التقاط من الكاميرا'),
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
        if (imageFile != null) {
          uImage.add(Image1(imageFile!));
        }
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
        if (imageFile != null) {
          uImage.add(Image1(imageFile!));
        }
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  selectScreen(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_ /*context*/) {
      return page;
    }));
  }
}
