import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/models/json/categorie_get_by_id_json.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/json/product_add_json.dart';
import 'package:front/models/json/product_get_by_id.dart';
import 'package:front/models/json/product_get_json.dart';
import 'package:front/models/network/api_categorie_get_by_id.dart';
import 'package:front/models/network/api_categories_get.dart';
import 'package:front/models/network/api_product_add.dart';
import 'package:front/models/network/api_product_get.dart';
import 'package:front/models/network/api_product_get_by_id.dart';
import 'package:front/views/product_detail.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class ProductsController extends GetxController {
  ApiCategoriesGet apiCategoriesGet = ApiCategoriesGet();
  ApiCategoriesGetById apiCategoriesGetById = ApiCategoriesGetById();
  CategorieJson? categorieJson;
  CategorieGetByIdJson? categorieGetByIdJson;

  ApiProductsGet apiProductsGet = ApiProductsGet();
  ApiProductGetById apiProductGetById = ApiProductGetById();
  ApiProductAdd apiProductAdd = ApiProductAdd();
  ProductGetJson? productGetJson;
  ProductGetByIdJson? productGetByIdJson;
  ProductAddJson? productAddJson;
  dio.Dio dio_ = dio.Dio(dio.BaseOptions(
      baseUrl: AppApi.baseUrl,
      //  receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 6000),
      receiveTimeout: Duration(seconds: 6000),
      headers: <String, String>{
        //'Contentt-Type': 'application/x-www-form-urlencoded',
        //  'Content-Type': 'application/json',
        'Content-Type': 'multipart/form-data',
      }));
  @override
  void onInit() {
    getCategories();
    getProducts();
    //  createProduct();
    // Initialisations spécifiques à ce contrôleur
    super
        .onInit(); // N'oubliez pas d'appeler super.onInit() pour respecter le cycle de vie de GetX.
  }

  getCategories() {
    apiCategoriesGet.getData().then((value) {
      print("success get categories");
      categorieJson = value as CategorieJson;
      if (categorieJson!.data != null) {
        return categorieJson!;
      }
      return null;
      print("data categories =================== ${categorieJson!.message}");
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return categorieJson!;
    });
  }

  getNameCategory() {
    print('namecategory');
    String? nameCat;
    apiProductsGet.getData().then((value) {
      for (int i = 0; i < productGetJson!.data!.length; i++) {
        print('for1-------------------------------------');
        for (int y = 0; y < categorieJson!.data!.length; y++) {
          print('for2-------------------------------------');
          if (productGetJson!.data![i].category ==
              categorieJson!.data![y].sId) {
            print(
                '*************************************if**********************');
            // nameCat =
            //     getCategorieById(productGetJson!.data![i].category.toString())
            //         .toString();
            // getCategorieById(productGetJson!.data![i].category) =  categorieJson!.data![y].name
            print(
                '**********NAMECATEGORY**************${getCategorieById(categorieJson!.data![y].sId.toString())}***********************');
          }
        }
      }
    });
    // update();
  }

  getCategorieById(String id) {
    print('category by id-----------------------');
    apiCategoriesGetById.id = id;
    return apiCategoriesGetById.getData().then((value) {
      categorieGetByIdJson = value as CategorieGetByIdJson?;
      print(
          "data categorie by id=================== ${categorieGetByIdJson!.data!.name}");

      // AccountInfoStorage.saveCatgorieName(
      //     categorieGetByIdJson!.data!.name.toString());
      // print(
      //     " save storage data ======= ${AccountInfoStorage.readCategorieName().toString()}");
      print('++++++++++++++++++++++++++++++++++');
      AccountInfoStorage.saveCatgorieName(categorieGetByIdJson!.data!.name);
      AccountInfoStorage.readCategorieName().toString();
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
    //  return null;

    //return "${categorieGetByIdJson!.data!.name}";
  }

  getProducts() {
    return apiProductsGet.getData().then((value) async {
      print("success get products");
      productGetJson = value as ProductGetJson?;
      if (productGetJson!.data != null) {
        return productGetJson!;
      }
      return null;
      /*   await getCategorieById(productGetJson!.toJson().toString());
      print('************${productGetJson!.data!.toString()}');
 */
      print("data products================== ${productGetJson!.message}");
    }).onError((error, stackTrace) {
      print("errorr ====== $error");
      return productGetJson!;
    });
  }

  getProductById(String id) {
    print("product by id ");
    apiProductGetById.id = id;
    apiProductGetById.getData().then((value) {
      productGetByIdJson = value as ProductGetByIdJson?;
      print(
          "data product by id ============================${productGetByIdJson!.data}");
      AccountInfoStorage.saveProductName(
          productGetByIdJson!.data!.nameproduct.toString());
      AccountInfoStorage.saveProductPrice(
          productGetByIdJson!.data!.price.toString());
      AccountInfoStorage.saveProductDescription(
          productGetByIdJson!.data!.description.toString());
      AccountInfoStorage.saveProductImage(
          productGetByIdJson!.data!.images.toString());

      Get.to(ProductDetail());
    }).onError((error, stackTrace) {
      print("error product by id ==== $error");
    });
    return null;
  }

  getAllProductByUserId() {
    print("Product by user id ---------------------");
    /*   apiEventGetByUserId.id = AccountInfoStorage.readId().toString();
    return apiEventGetByUserId.getData().then((value) {
      print('value===========> $value');
      eventByUserIdJson = value as EventByUserIdJson?;
      print(
          "Events by user id =============== ${eventByUserIdJson!.data![0].user}");
      if (eventByUserIdJson!.data != null) {
        return eventByUserIdJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    }); */
  }

  createProduct() {
    print('************************create product***********************');
    //  print("testtttttttttttttt${productAddJson!.status}");
//    AccountInfoStorage.readCategorieId();
    dio.FormData formData1 = dio.FormData.fromMap({
      "nameproduct": "cake1",
      "description": "gold1",
      "price": 300,
      "images": [],
      "category": "65003a1663b17957f87ce303",
      "user": "6516a67346a878d8ee68b360",
    });
    /*   Map<String, dynamic> data = {
      "nameproduct": "cake1",
      "description": "gold1",
      "price": 300,
      //"images": "1696276665041-Happy Birthday 2023.png",
      "category": "65003a1663b17957f87ce303",
      "user": "6516a67346a878d8ee68b360",
    }; */
    // print(
    //     'Data Product ID--------------------->${AccountInfoStorage.readProductId().toString()}');
    // print(
    //     'Data Product ID--------------------->${AccountInfoStorage.readCategorieId().toString()}');
    print('name==================> ${AccountInfoStorage.readProductName()}');
    print(
        'userid==================> ${AccountInfoStorage.readId().toString()}');

    dio_.post(AppApi.createProductsUrl, data: formData1).then((value) {
      print('success+++++++++++++++> $value');
      // productAddJson = value as ProductAddJson?;
      //  print('name==================> ${AccountInfoStorage.readProductName()}');

      // print('event created=======> ${productAddJson!.data!.sId}');
    }).onError((error, stackTrace) {
      print('error create product ==========> $TypeError');
    });
  }
  
    List<File> selectedImages = []; // List of selected image
    final picker = ImagePicker(); // Instance of Image picker
    Future getImages() async {
      final pickedFile = await picker.pickMultiImage(
          imageQuality: 100, // To set quality of images
          maxHeight:
              1000, // To set maxheight of images that you want in your app
          maxWidth:
              1000); // To set maxheight of images that you want in your app
      List<XFile> xfilePick = pickedFile;

      if (xfilePick.isNotEmpty) {
        for (var i = 0; i < xfilePick.length; i++) {
          //selectedImages.add(File(xfilePick[i].path));
        }
      } else {
          Get.snackbar('Notification',"Nothing is selected");
      }
    }



}
