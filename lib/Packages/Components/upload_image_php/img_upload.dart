import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Upload_Image extends StatefulWidget {
  static const String id = 'Upload_Image';
  bool? galleryOrCamera ;
  String? bathImage='profile' ;
  Upload_Image({Key? key,this.galleryOrCamera=true ,bathImage='profile' }) : super(key: key);

  @override
  Upload_ImageState createState() => Upload_ImageState();
}

class Upload_ImageState extends State<Upload_Image> {
  @override
  late File? file =null;
  String status = '';
  late String base64Image ='';
  // late File? tmpFile =null;
  final ImagePicker _picker = ImagePicker();
  String errMessage = 'Error Uploading Image';

  void chooseImage(bool galleryOrCamera) async {
    // setState(() {
    //   file =
    //   ImagePicker().pickImage(source: ImageSource.gallery) as Future<File>;
    // });
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(source: galleryOrCamera?ImageSource.gallery:ImageSource.camera );
      final imageTemorary = File(image!.path);
      if (image == null) {
        return;
      }
      setState(() {
        file = imageTemorary;
      });

    } on PlatformException catch (e) {
      setStatus("Failed to pick image : $e");
    }

  }

  //  btnplane(BuildContext ctx, bool galleryOrCamera) {
  //   showModalBottomSheet(
  //     // useRootNavigator: true,
  //       isScrollControlled: true,
  //       context: ctx,
  //       builder: (_) {
  //         return Container(
  //           padding: EdgeInsets.all(30.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               OutlineButton(
  //                 onPressed: ()=> chooseImage(galleryOrCamera),
  //
  //                 child: Text('Choose Image'),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               showImage(),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               OutlineButton(
  //                 onPressed: startUpload,
  //                 child: Text('Upload Image'),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               Text(
  //                 status,
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.green,
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 20.0,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //   );
  // }

  Widget showImage() {
    return Container(
      height: 255,
      child: file!=null?Image.file(file!):Container(child: const Text('no image'),),
      // FutureBuilder<File>(
      //   // future: file,
      //   builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done &&
      //         snapshot.data! != null  ) {
      //       print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      //       tmpFile = snapshot.data!;
      //       base64Image = base64Encode(snapshot.data!.readAsBytesSync());
      //       return Flexible(
      //         child: Image.file(
      //           snapshot.data!,
      //           fit: BoxFit.fill,
      //         ),
      //       );
      //     } else if (null != snapshot.error) {
      //       print('Error Picking Image');
      //       return const Text(
      //         'Error Picking Image',
      //         textAlign: TextAlign.center,
      //       );
      //     } else {
      //       print('No Image Selected');
      //       return const Text(
      //         'No Image Selected',
      //         textAlign: TextAlign.center,
      //       );
      //     }
      //   },
      // ),
    );
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == file) {
      setStatus(errMessage);

      return;
    }
    // "data:image/png;base64,"+
    final bytes = File(file!.path).readAsBytesSync();
     base64Image =  base64Encode(bytes);
    print(base64Image);
    String fileName = file!.path
        .split('/')
        .last;
    print(fileName);
    upload(fileName);

  }

  upload(String fileName) {
    var now = DateTime.now();
    http.post(Uri.parse(
        "https://zuporjict1.000webhostapp.com/upload_image/uploadEndPoint.php"
    ), body: {//now.toString()+
      "image": base64Image,
      "name": widget.bathImage!+'@'+fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      Register().postDataUpdateImage( picture_user: 'image/'+widget.bathImage!+'/'+fileName);
      Navigator.pop(context);
    }).catchError((error) {
      setStatus(error);
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.purple,
        title: Text("Upload Image Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: ()=>chooseImage(widget.galleryOrCamera!),
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }



void setStatus(String str) {
 Register().tostforRegsetr(str);
}
}
