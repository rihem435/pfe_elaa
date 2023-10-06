/* import 'package:flutter/foundation.dart';
import 'package:cloudinary/cloudinary.dart';

class CloudImage with ChangeNotifier {
  dynamic _response;
  List<String>? _urlList;
  bool _isloading = true;
  dynamic get urlList => _urlList;
  String get response => _response;
  bool get isloading => _isloading;

  Cloudinary client = Cloudinary.signedConfig(
      apiKey: '872948247576765',
      apiSecret: '_Rl01bDk9GpGQnjqM_YSsLNT2bQ',
      cloudName: 'elaa',
    );

 /*  Future<void> upload(List<String> imagesList) async {

    
    List<CloudinaryResponse> response =
        (await client.upload(fileName: "EventManagement", folder: "upload")) as List<CloudinaryResponse>;
    //    await client.uploadImages(imagesList, filename: "EventManagement");
    _response = response;
    notifyListeners();
    if (_response == null) {
      return null;
    } else {
      List<String> urlList = [];
      _response.forEach((element) {
        urlList.add(element.secure_url);
      });
      _urlList = urlList;
      _isloading = false;
      notifyListeners();
    }
  }
 */

  /* 
final Response = await Cloudinary.uploa(file: file.path,
fileBytes: file.readAsBytesSync(),
resourceType: CloudinaryResourceType.image,
folder: cloudinaryCustomFolder,
fileName: 'some-name',
progressCallback: (count, total) {
print(
'Uploading image from file with progress: $count/$total');
}),
);

if(response.isSuccessful) {
print('Get your image from with ${response.secureUrl}');
}  
 */
} */