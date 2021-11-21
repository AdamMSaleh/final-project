import 'dart:io';

import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  static File? imageSorce;

   ViewImage(File sorce, {Key? key}) : super(key: key) {
    imageSorce = sorce;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload a image'),
        centerTitle: true,
      ),
      body: Image.file(ViewImage.imageSorce!, width: (MediaQuery
          .of(context)
          .size
          .width),
      ),
    );
  }
}
