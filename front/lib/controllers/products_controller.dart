import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/models/json/categorie_get_by_id_json.dart';
import 'package:front/models/json/categorie_get_by_name_json.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/json/favorite__create_json.dart';
import 'package:front/models/json/favorite_all_json.dart';
import 'package:front/models/json/favorite_by_id_json.dart';
import 'package:front/models/json/favorite_by_state_json.dart';
import 'package:front/models/json/favorite_by_user_id_and_state_json.dart';
import 'package:front/models/json/favorite_by_user_id_json.dart';
import 'package:front/models/json/login_user_json.dart';
import 'package:front/models/json/product_add_json.dart';
import 'package:front/models/json/product_by_user_is_json.dart';
import 'package:front/models/json/product_get_by_id.dart';
import 'package:front/models/json/product_get_json.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/network/api_categorie_get_by_id.dart';
import 'package:front/models/network/api_categorie_get_by_name.dart';
import 'package:front/models/network/api_categories_get.dart';
import 'package:front/models/network/api_favorite_all.dart';
import 'package:front/models/network/api_favorite_by_id.dart';
import 'package:front/models/network/api_favorite_by_state.dart';
import 'package:front/models/network/api_favorite_create.dart';
import 'package:front/models/network/api_favorite_delete.dart';
import 'package:front/models/network/api_favorite_get_by_user_id.dart';
import 'package:front/models/network/api_favorite_get_by_user_id_and_state.dart';
import 'package:front/models/network/api_get_user_by_id.dart';
import 'package:front/models/network/api_product_add.dart';
import 'package:front/models/network/api_product_get.dart';
import 'package:front/models/network/api_product_get_by_id.dart';
import 'package:front/models/network/api_products_get_by_user_id.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/widgets/components/image_cloudinary.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductsController extends GetxController {
  ApiCategoriesGet apiCategoriesGet = ApiCategoriesGet();
  ApiCategoriesGetById apiCategoriesGetById = ApiCategoriesGetById();
  CategorieJson? categorieJson;
  CategorieGetByIdJson? categorieGetByIdJson;
  CategorieGetByNameJson? categorieGetByNameJson;

  ApiProductsGet apiProductsGet = ApiProductsGet();
  ApiProductGetById apiProductGetById = ApiProductGetById();
  ApiProductAdd apiProductAdd = ApiProductAdd();
  ApiCategoriesGetByName apiCategoriesGetByName = ApiCategoriesGetByName();
  ApiProductsGetByUserId apiProductsGetByUserId = ApiProductsGetByUserId();

  ProductsByUserIdJson? productsByUserIdJson;
  ProductGetJson? productGetJson;
  ProductGetByIdJson? productGetByIdJson;
  ProductAddJson? productAddJson;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  List<String> imgList = [];

  dio.Dio dio_ = dio.Dio(
    dio.BaseOptions(
        baseUrl: AppApi.baseUrl,
        //  receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 6000),
        receiveTimeout: Duration(seconds: 6000),
        headers: <String, String>{
          //'Contentt-Type': 'application/x-www-form-urlencoded',
          //  'Content-Type': 'application/json',
          'Content-Type': 'multipart/form-data',
        }),
  );



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
    return apiCategoriesGet.getData().then((value) {
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

  getCategorieByName() {
    print('category by name-----------------------');
    apiCategoriesGetByName.name;
    return apiCategoriesGetByName.getDataByName().then((value) {
      categorieGetByNameJson = value as CategorieGetByNameJson?;
      print(
          "data categorie by name=================== ${categorieGetByNameJson!.existingCategorie!.name}");

      AccountInfoStorage.saveCatgorieName(
          categorieGetByNameJson!.existingCategorie!.sId);
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
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
      //print("data products================== ${productGetJson!.message}");
    }).onError((error, stackTrace) {
      print("errorr ====== $error");
      return productGetJson!;
    });
  }

  getProductById() async {
    print("product by id ");
    apiProductGetById.id = AccountInfoStorage.readProductId().toString();

    try {
      await apiProductGetById.getData().then((value) {
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

        print(
            "lenght image list=====${productGetByIdJson!.data!.images!.length}");

        /* if (imgList!.isNotEmpty) {
        for (int i = 0; i < productGetJson!.data![i].images!.length; i++) {
          print(imgList![i].nameproduct);
          if (FavoriteProducts![i].favorite == true) {
            listFavProd.add(FavoriteProducts![i].sId.toString());
            print("list$listFavProd");
          }
        }
      } */

        Get.to(ProductDetail());
      });
      update();
    } catch (error) {
      print("error product by id ==== $error");
    }
  }

///////to do
  getAllProductByUserId() async {
    print("Product by user id ---------------------");
    apiProductsGetByUserId.id = AccountInfoStorage.readId().toString();

    return await apiProductsGetByUserId.getData().then((value) {
      print('value===========> $value');
      //////////the value is null
      productsByUserIdJson = value as ProductsByUserIdJson?;

      if (productsByUserIdJson!.data != null) {
        // print("Product by user id =============== ${productsByUserIdJson!.data![0].user}");
        return productsByUserIdJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  }

  createProduct() {
    print('************************create product***********************');
    /*  dio.FormData formData1 = dio.FormData.fromMap({
      "nameproduct": productNameController.text,
      "description": productDescriptionController.text,
      "price": productPriceController.text.toString(),
      //"images": [],
      "category": AccountInfoStorage.readCategorieName().toString(),
      "user": AccountInfoStorage.readId().toString(),
    }); */
    Map<String, dynamic> data = {
      "nameproduct": productNameController.text,
      "description": productDescriptionController.text,
      "price": productPriceController.text,
      //"images":[],
      // "favorite": false,
      "category": AccountInfoStorage.readCategorieName().toString(),
      "user": AccountInfoStorage.readId().toString(),
    };

    apiProductAdd.postData(data).then((value) {
      print('success+++++++++++++++> $value');
      getProducts();
      // productAddJson = value as ProductAddJson?;
      //  print('name==================> ${AccountInfoStorage.readProductName()}');

      // print('event created=======> ${productAddJson!.data!.sId}');
    }).onError((error, stackTrace) {
      print('error create product ==========> $TypeError');
    });
    update();
  }

  ImageCloudinary imageCloudinary = ImageCloudinary();
List<File> profilePicFiles = [];
  Future<void> directUpdateMultiImage(List<XFile> files) async {
    if (files == null) return;
profilePicFiles = files.map((xfile) => File(xfile.path)).toList();
  print("Uploaded Images: ${profilePicFiles.map((file) => file.path).toList()}");
  
  // Call your upload function here for each image in profilePicFiles
  for (var file in profilePicFiles) {
    await imageCloudinary.uploadMultiImagesToCloudinary(profilePicFiles);
  }

  update();
  }



/* 
   Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

   
      images = resultList;
      _error = error;
  
  }

 */
  // final ImagePicker imagePicker = ImagePicker();
  // List<XFile>? imageFileList = [];
  // List<File> selectedImages = []; // List of selected image

 

  /* updateProductByIdFav(bool favorited) {
    print("update prod by id fav   ${favorited}");
    apiProductGetById.id = AccountInfoStorage.readProductId().toString();
    apiProductGetById.updateData({
      'favorite': favorited,
    }).then((value) {
      productGetByIdJson = value as ProductGetByIdJson?;
      print(
          "update prod by id  after fav   ${productGetByIdJson!.data!.favorite}");
      print("update prod by id fav${favorited}");
      print("success ${value} ${favorited}");
      //Get.to(ProductDetail());
      update();
    }).onError((error, stackTrace) {
      print("error fav product by id ==== $error");
    });
    // update();
  }

   */

  ApiUserById apiUserById = ApiUserById();
  UserGetByIdJson? userGetByIdJson;

  /* updateFavoriteListProducts() {
    apiUserById.id = AccountInfoStorage.readId().toString();
    apiUserById.updateData({'products': savedFavProd}).then((value) {
      print("success updateFavoriteListProducts");
      update();

      // Get.to(FavoriteView());
    }).onError((error, stackTrace) {
      print('error updateFavoriteListProducts ======> $error');
    });
  } */

  //////////////////////////////// Favorite  ////////////////////////////////
  ///
  ///
  bool? isFavorite;

  void favoriteIcon() {
    print("favorite");
    isFavorite = !isFavorite!;
    update();
  }

  List<Products?> savedFavProd = [];

  ApiFavoriteCreate apiFavoriteCreate = ApiFavoriteCreate();
  ApiFavoriteDeleteById apiFavoriteDeleteById = ApiFavoriteDeleteById();
  ApiFavoriteGetByUserId apiFavoriteGetByUserId = ApiFavoriteGetByUserId();
  ApiFAvoriteGetById apiFAvoriteGetById = ApiFAvoriteGetById();
  ApiFAvoriteGetState apiFAvoriteGetState = ApiFAvoriteGetState();
  ApiFavoriteAll apiFavoriteAll = ApiFavoriteAll();
  ApiFavoriteByUserIdAndState apiFavoriteByUserIdAndState =
      ApiFavoriteByUserIdAndState();

  FavoriteByUserIdJson? favoriteByUserIdJson = FavoriteByUserIdJson();
  FavoriteAllJson? favoriteAllJson = FavoriteAllJson();
  FavoriteByIdJson? favoriteByIdJson = FavoriteByIdJson();
  FavoriteCreateJson? favoriteCreateJson = FavoriteCreateJson();
  FavoriteGeByStatetJson? favoriteGeByStatetJson = FavoriteGeByStatetJson();
  FavoriteByUserIdAndStateJson? favoriteByUserIdAndStateJson =
      FavoriteByUserIdAndStateJson();

  createFavorite() async {
    print(
        "---------------------- favorite create --------------------------------");

    Map<String, dynamic> data = {
      "state": true,
      "products": AccountInfoStorage.readProductId().toString(),
      "user": AccountInfoStorage.readId().toString(),
    };
    try {
      await apiFavoriteCreate.postData(data).then((value) {
        print('success+++++++++++++++> $value');
        // getProducts();
        favoriteCreateJson = value as FavoriteCreateJson?;
        print("id favorite =====> ${favoriteCreateJson!.data!.sId}");

        // productAddJson = value as ProductAddJson?;
        //  print('name==================> ${AccountInfoStorage.readProductName()}');

        // print('event created=======> ${productAddJson!.data!.sId}');
      });
      getAllFavoriteByUserId();
      AccountInfoStorage.saveProductId(favoriteCreateJson!.data!.products);
      getProductById();
      update();
    } catch (error) {
      print('error create favorite ==========> $TypeError');
    }
  }

  getFavoriteById() {
    print("--------------------------------favorite by id ");
    apiFAvoriteGetById.id = AccountInfoStorage.readFavoriteId().toString();
    apiFAvoriteGetById.getData().then((value) {
      favoriteByIdJson = value as FavoriteByIdJson?;
      print(
          "data favorite by id ============================${favoriteByIdJson!.data}");
    }).onError((error, stackTrace) {
      print("error favorite by id ==== $error");
    });
    update();
  }

  getFavoriteByState() {
    print("-------------------------------------favorite by state ");
    apiFAvoriteGetState.state =
        AccountInfoStorage.readFavoriteState().toString();
    apiFAvoriteGetState.getDataByState().then((value) {
      favoriteGeByStatetJson = value as FavoriteGeByStatetJson?;
      print(
          "data favorite by state ============================${favoriteByIdJson!.data}");
    }).onError((error, stackTrace) {
      print("error favorite by id ==== $error");
    });
    update();
  }

  updateFavorite(bool? favoriteState) async {
    apiFAvoriteGetById.id = AccountInfoStorage.readFavoriteId().toString();
    try {
      await apiFAvoriteGetById
          .updateData({"state": favoriteState}).then((value) {
        print('update success----------------------');

        favoriteByIdJson = value as FavoriteByIdJson?;
        AccountInfoStorage.saveFavoriteState(
            "${favoriteByIdJson!.data!.state}");
      });
      getAllFavoriteByUserId();
      AccountInfoStorage.saveProductId(favoriteByIdJson!.data!.products);
      getProductById();
      update();
    } catch (error) {
      print('error update FAvorite======> $error');
    }
  }

  getAllFavoriteByUserId() async {
    print("-------------------------Product by user id ---------------------");
    apiFavoriteGetByUserId.id = AccountInfoStorage.readId().toString();

    try {
      return await apiFavoriteGetByUserId.getData().then((value) {
        print('value fav prod===========> $value');
        //////////the value is null
        favoriteByUserIdJson = value as FavoriteByUserIdJson?;
        print(
            '----------------------------------------------fav----${favoriteByUserIdJson!.data}');

        if (favoriteByUserIdJson!.data != null) {
          // print("Product by user id =============== ${productsByUserIdJson!.data![0].user}");
          print(
              '++++++++++++++++++++++++++++++++++++++++++++++++++${favoriteByUserIdJson!.data!.length}');
          return favoriteByUserIdJson;
        }

        print('----------------------------------------------fav----');

        update();
      });
    } catch (error) {
      print('error======> $error');
    }
  }

  getAllfavoriteByUserIdAndState() async {
    print(
        "-------------------------favoriteByUserIdAndState---------------------");
    apiFavoriteByUserIdAndState.id = AccountInfoStorage.readId().toString();
    apiFavoriteByUserIdAndState.state = AccountInfoStorage.readFavoriteState().toString();

    try {
      return await apiFavoriteByUserIdAndState
          .getDataByUserIdAndState()
          .then((value) {
        print('value favoriteByUserIdAndState===========> $value');
        //////////the value is null
        favoriteByUserIdAndStateJson = value as FavoriteByUserIdAndStateJson?;
        print(
            '----------------------------------------------fav----${favoriteByUserIdAndStateJson!.data}');

        if (favoriteByUserIdAndStateJson!.data != null) {
          // print("Product by user id =============== ${productsByUserIdJson!.data![0].user}");
          print(
              '++++++++++++++++++++++++++++++++++++++++++++++++++${favoriteByUserIdAndStateJson!.data!.length}');
          return favoriteByUserIdAndStateJson;
        }

        print(
            '----------------------------------------------favoriteByUserIdAndState----');

        update();
      });
    } catch (error) {
      print('error favoriteByUserIdAndState======> $error');
    }
  }

  getFavorite() {
    return apiFavoriteAll.getData().then((value) async {
      print("success get products");
      favoriteAllJson = value as FavoriteAllJson?;
      if (favoriteAllJson!.data != null) {
        return favoriteAllJson!;
      }
      return null;
      /*   await getCategorieById(productGetJson!.toJson().toString());
      print('************${productGetJson!.data!.toString()}');
 */
      //print("data products================== ${productGetJson!.message}");
    }).onError((error, stackTrace) {
      print("errorr ====== $error");
      return favoriteAllJson!;
    });
  }

  deleteFavorite(String id) {
    apiFavoriteDeleteById.id = id;
    apiFavoriteDeleteById.deleteData().then((value) {
      print('success Favorite delete');
    }).onError((error, stackTrace) {
      print('erorr delete favorite  === > $error');
    });
    update();
  }

  //List<Map<String, dynamic>>? listeDeMaps;
  bool prodExiste(
    List<DataFav> listMap,
    dynamic value,
  ) {
    for (final map in listMap) {
      if (map.products == value) {
        print("+++++++++++++++++++true-------------------");
        return true;
      }
    }
    print('------------------------false--------------------');
    return false;
  }



/////////////////multi images
///
///





}
