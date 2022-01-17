import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {


  ImageView(this.url, {Key? key}) : super(key: key);
  String url;

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blue,
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: AppColors.blue,
          ),
          imageProvider: NetworkImage(widget.url),
        ));
  }
}
