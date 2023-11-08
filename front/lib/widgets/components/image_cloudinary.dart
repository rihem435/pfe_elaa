import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageCloudinary {
  Future<String?> uploadToCloudinary(File? imageFile) async {
    try {
      final dio = Dio();
      final apiKey = '872948247576765';
      final uploadPreset = 'EventManagement';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile!.path,
            filename: '$imageFile'),
        'upload_preset': uploadPreset,
        'api_key': apiKey,
      });

      final response = await dio.post(
        'https://api.cloudinary.com/v1_1/elaa/image/upload',
        data: formData,
      );
      print("ttttttttttttttttttttttt${imageFile.path}");
      if (response.statusCode == 200) {
        final secureUrl = response.data['secure_url'];
        print(" URL ${secureUrl}");
        AccountInfoStorage.saveImage("$secureUrl");

        return secureUrl;
      }
    } catch (e) {
      print('Error uploading to Cloudinary: $e');
    }
    return null;
  }

  ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    // setState((){});
    print(AccountInfoStorage.saveProductImage(
        selectedImages.toList().toString()));
  }

///////////////multiple

  Future<List<XFile>> selectMultipleImages() async {
    List<XFile> images = [];
    final picker = ImagePicker();
    final galleryImages = await picker.pickMultiImage();
    if (galleryImages != null) {
      images = galleryImages;
    }
    print("Image List Length:" + images!.length.toString());

    return images;
  }

  Future<List<String?>> uploadMultiImagesToCloudinary(
      List<File> imageFiles) async {
    List<String> uploadedUrls = [];

    for (var imageFile in imageFiles) {
      try {
        final dio = Dio();
        final apiKey = 'your_api_key'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });

        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          final secureUrl = response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }
}
