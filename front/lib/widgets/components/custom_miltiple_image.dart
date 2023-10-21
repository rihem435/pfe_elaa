/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker imagePicker = ImagePicker();
List<File>? imageFileList = [];

Future<String?> selectImages() async {
  final List<File> selectedImages = (await imagePicker.pickMultiImage()).cast<File>();
  if (selectedImages!.isNotEmpty) {
    imageFileList!.addAll(selectedImages);
  }
  print("Image List Length:" + imageFileList!.length.toString());
  // setState(() {});
}

class CustomMiltipleImage extends StatelessWidget {
  const CustomMiltipleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            selectImages();
          },
          child: Text('Select Images'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: imageFileList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(
                    File(imageFileList![index].path),
                    fit: BoxFit.cover,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
 */