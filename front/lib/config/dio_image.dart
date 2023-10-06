import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioImage {
  /* var dio = Dio();
String fileName = imageFile.path.split('/').last;
FormData formData = FormData.fromMap({
  "image-param-name": await MultipartFile.fromFile(
    imageFile.path,
    filename: fileName,
    contentType: new MediaType("image", "jpeg"), //add this
  ),
});

var response = await dio.post(
  "url",
  data: formData,
  options: Options(
    headers: {
      "Authorization": auth-token
    },
  ),
  onSendProgress: (int sent, int total) {
    debugPrint("sent${sent.toString()}" + " total${total.toString()}");
  },
).whenComplete(() {
  debugPrint("complete:");
}).catchError((onError) {
  debugPrint("error:${onError.toString()}");
}); */
}
