import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class MyImageWidget extends StatefulWidget {
  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  ProfileColntroller controller = ProfileColntroller();
  File? profilePicFile;
  String imageUrl = '';
//   Function to select an image using image_picker
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // You can also use ImageSource.camera to capture a photo

    if (pickedFile == null) {
      // User canceled image selection
      return null;
    }

    return File(pickedFile.path);
  }

  // Your directUpdateImage function
  Future<void> directUpdateImage(File? file) async {
    if (file == null) return;

    try {
      // Extract the filename (basename) from the provided file path
      String fileName = basename(file.path);

      // Save the file using its basename
      await file.copy(File('${AppApi.getImageUser}$fileName').path);

      // Construct the image URL using the filename
      String newImageUrl =
          "${AppApi.getImageUser}${AccountInfoStorage.saveImage(fileName)}";

      setState(() {
        profilePicFile = file;
        imageUrl = newImageUrl;
      },);

      print('Filename: $fileName');
      print('Image URL: $imageUrl');

      
      
    } catch (error) {
      print('Error saving image or updating: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the image or a placeholder
        profilePicFile != null ? Image.file(profilePicFile!) : Placeholder(),

        // Display the image URL or a message
        Text(
            imageUrl.isNotEmpty ? 'Image URL: $imageUrl' : 'No image selected'),

        // Button to trigger image update
        ElevatedButton(
          onPressed: () async {
            // Call your directUpdateImage function here
            // Replace with your image selection logic
            File? newImage = await pickImage();
            if (newImage != null) {
              await directUpdateImage(newImage);
            }
          
          },
          child: Text('Select and Update Image'),
        ),
      ],
    );
  }
}
