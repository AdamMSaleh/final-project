// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, unnecessary_null_comparison, avoid_init_to_null, override_on_non_overriding_member, camel_case_types, sized_box_for_whitespace, must_be_immutable, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/infi_professionals.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_mechanice.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_owner.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_shop.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_user_Eng.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/register.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/Components/fill_plan.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Upload_Image extends StatefulWidget {
  static const String id = 'Upload_Image';
  bool? galleryOrCamera;

  String? bathImage = '';

  Upload_Image(
      {Key? key, this.galleryOrCamera = true, this.bathImage = 'profile'})
      : super(key: key);

  @override
  Upload_ImageState createState() => Upload_ImageState();
}

class Upload_ImageState extends State<Upload_Image> {
 static String profileImage='';
  @override
  late File? file = null;
  String status = '';
  late String base64Image = '';
  // late File? tmpFile =null;
  final ImagePicker _picker = ImagePicker();
  String errMessage = 'Error Uploading Image';
  String? bathImagereturn = '';
  void chooseImage(bool galleryOrCamera) async {
    // setState(() {
    //   file =
    //   ImagePicker().pickImage(source: ImageSource.gallery) as Future<File>;
    // });
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(
          source: galleryOrCamera ? ImageSource.gallery : ImageSource.camera);
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
      child: file != null
          ? Image.file(file!)
          : Container(
              child: const Text('no image'),
            ),
      // FutureBuilder<File>(
      //   // future: file,
      //   builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done &&
      //         snapshot.data! != null  ) {
      // //       print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      //       tmpFile = snapshot.data!;
      //       base64Image = base64Encode(snapshot.data!.readAsBytesSync());
      //       return Flexible(
      //         child: Image.file(
      //           snapshot.data!,
      //           fit: BoxFit.fill,
      //         ),
      //       );
      //     } else if (null != snapshot.error) {
      // //       print('Error Picking Image');
      //       return const Text(
      //         'Error Picking Image',
      //         textAlign: TextAlign.center,
      //       );
      //     } else {
      // //       print('No Image Selected');
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
    base64Image = base64Encode(bytes);
    // // print(base64Image);
    String fileName = file!.path.split('/').last;
    // // print(fileName);
    upload(fileName);
  }

  upload(String fileName) {
    var now = DateTime.now();
    http.post(
        Uri.parse("http://relaxbuilding.space/upload_image/uploadEndPoint.php"),
        body: {
          //now.toString()+
          "image": base64Image,
          "name": widget.bathImage! + '@' + fileName,
        }).then((result) async {
      // print(widget.bathImage!);
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (widget.bathImage == 'Driver_license') {
        setState(() {
          bathImagereturn = 'image/' + widget.bathImage! + '/' + fileName;
        });
        Register().postImageDirvers(
            license_image: 'image/' + widget.bathImage! + '/' + fileName);
        // print('z,xcn,xmznc,mxznc,mzxncnm');
      } else if (widget.bathImage == 'syndicate_card') {
        setState(() {
          bathImagereturn = 'image/' + widget.bathImage! + '/' + fileName;
        });
        Register().postImageSyndicateCard(
            Guild_picture: 'image/' + widget.bathImage! + '/' + fileName);
      } else if (widget.bathImage == 'construction_license') {
        // هون لسا ما تفقدة الميثود
        setState(() {
          bathImagereturn = 'http://relaxbuilding.space/upload_image/image/' +
              widget.bathImage! +
              '/' +
              fileName;
          NewProject.constructionLicense = 'http://relaxbuilding.space/upload_image/image/' +
              widget.bathImage! +
              '/' +
              fileName;
        });
        print(bathImagereturn ?? "33");
        print(NewProject.constructionLicense ?? "33");

        // Register().postImageSyndicateCard(
        //     Guild_picture: 'image/' + widget.bathImage! + '/' + fileName);
      }else if (widget.bathImage == 'Plan_Image') {
        // هون لسا ما تفقدة الميثود
        setState(() {
          bathImagereturn = 'http://relaxbuilding.space/upload_image/image/' +
              widget.bathImage! +
              '/' +
              fileName;
          Fill_plane_page.Plan_Image = 'http://relaxbuilding.space/upload_image/image/' +
              widget.bathImage! +
              '/' +
              fileName;
        });
        print(bathImagereturn ?? "33");
        print(NewProject.constructionLicense ?? "33");

        // Register().postImageSyndicateCard(
        //     Guild_picture: 'image/' + widget.bathImage! + '/' + fileName);
      } else {
        setState(() {
          bathImagereturn = 'image/' + widget.bathImage! + '/' + fileName;
        });
      await  Register().postDataUpdateImage(
            picture_user: 'image/' + widget.bathImage! + '/' + fileName);
        setState(() {
          profileImage='http://relaxbuilding.space/upload_image/image/' +
              widget.bathImage! +
              '/' +
              fileName;

        });

        print(profileImage+'16s6516s51d6s15d65s120s50s');
      }
      if (PageRegister.accType == '1') {
        // المهندس

        Navigator.pushNamed(
          context,
          PageInfoEng.id,
        );
      } else if (PageRegister.accType == '2') {
        //صاحب مهنه
        Navigator.pushNamed(
          context,
          PageInfoPr.id,
        );
      } else if (PageRegister.accType == '3') {
        //العمال
        //PageInfoworker
        Navigator.pushNamed(
          context,
          PageInfoworker.id,
        );
      } else if (PageRegister.accType == '6') {
        //المالك العقار
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PageInfowner()),
        );
      } else if (PageRegister.accType == '4') {
        //صاحب المتجر
        Navigator.pushNamed(
          context,
          PageInfoShope.id,
        );
      } else if (PageRegister.accType == '5') {
        //اصحاب الالات
        Navigator.pushNamed(context, PageInfoMech.id);
      }else {
        Navigator.pop(context);
      }
    }).catchError((error) {
      setStatus(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Upload Image Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // ignore: deprecated_member_use
              OutlineButton(
                onPressed: () => chooseImage(widget.galleryOrCamera!),
                child: const Text('Choose Image'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              showImage(),
              const SizedBox(
                height: 20.0,
              ),
              // ignore: deprecated_member_use
              OutlineButton(
                onPressed: startUpload,
                child: const Text('Upload Image'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                status,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setStatus(String str) {
    Register().tostforRegsetr(str);
  }
}
