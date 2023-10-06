import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/models/json/login_user_json.dart';
import 'package:front/models/json/user_all_json.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/network/api_get_user_by_id.dart';
import 'package:front/models/network/api_loginn.dart';
import 'package:front/models/network/api_signup.dart';
import 'package:front/models/network/api_user_all.dart';
import 'package:front/views/admin/home_view_admin.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/views/vendors/home_view_vendor.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class ProfileColntroller extends GetxController {
  Dio dio1 = Dio();

  UserGetByIdJson? userJson;
  LoginUserJson? loginUserJson;
  UsersAllJson? usersAllJson;
  ApiUserAll? apiUserAll;
  ApiLoginn apiLoginn = ApiLoginn();
  ApiUserById apiUserById = ApiUserById();
  UserGetByIdJson? userGetByIdJson;
  ApiSignup apisignup = ApiSignup();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController itemscontroller = TextEditingController();
  bool passwordsMatch = true;
  bool isVisiblePassword = true;
  bool confirmPassword = true;

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

  String InputValidator() {
    print('Validate password');

    if (usernameController.text.isEmpty) {
      print('Name should not be empty');
    } else {
      GetUtils.isLengthGreaterThan(usernameController.text, 6)
          ? print('Name is valid')
          : print('Name is invalid, user name need 6 caracters or more!!!');
    }
    GetUtils.isEmail(emailController.text)
        ? print('Email is valid')
        : print('Email is invalid!!!');

    GetUtils.isNull(itemscontroller.text)
        ? print('role isn`t selected')
        : print('role is selected');
    // return "$itemscontroller";

    if (confirmPasswordController.text.isEmpty &&
        passwordController.text.isEmpty) {
      print("pass is empty");
      return 'pass is empty';
      // passwordsMatch = true;
    } else if (confirmPasswordController.text == passwordController.text) {
      print("pass do match");
      return 'pass do match';
      // passwordsMatch = true;
    } else {
      print("pass does not match");
      return 'pass does not match';
      //passwordsMatch = false;
    }
  }

  void showPassword() {
    print('show password');
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  void showConfirmPassword() {
    print('confirm password');
    confirmPassword = !confirmPassword;
    update(); // rebuild
  }
//////////////////////////calendar selection /////////////////////

  String? date;
  Future checkValueMembers() async {
    await getData();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    date = sharedPreferences.getString("data");
    print('get $date');
  }

  saveData(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("data", date);
    print('save$date');
  }

  DateTime selectedDate = DateTime.now(); // Initialize with the current date

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) print("$picked");
    selectedDate = picked!;
  }

  ////////////////////image/////////////////////////
  File? profilePicFile;
  Future<void> directUpdateImage(File? file) async {
    if (file == null) return;
    profilePicFile = file;
    update();
  }

  ////////////function login/////////////////
  signIn() {
    print("----------------signin-----------------");
    apiLoginn.postData({
      "username": usernameController.text,
      "password": passwordController.text,
    }).then((value) {
      print('success signin------------------------');

      loginUserJson = value as LoginUserJson?;
      AccountInfoStorage.saveId(loginUserJson!.user!.sId.toString());
      AccountInfoStorage.saveEmail(loginUserJson!.user!.email.toString());
      AccountInfoStorage.saveName(loginUserJson!.user!.username.toString());
      AccountInfoStorage.saveItems(loginUserJson!.user!.items.toString());
      AccountInfoStorage.saveImage(loginUserJson!.user!.image);
      AccountInfoStorage.saveTokenUser(loginUserJson!.tokens!.accessToken);

      print('success signin');
      if (loginUserJson!.user!.items == "Customer") {
        print('Customer');
        Get.to(HomeView());
      } else if (loginUserJson!.user!.items == "Vendor") {
        print('Vendor');

        Get.to(HomeViewVendor());
      }
    }).onError((error, stackTrace) {
      ///// modifier ui /////////////
      Get.snackbar("", " User Name or Password Does not match",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Sothing went wrong",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
      print('erro login=====================> $error');
    });
  }

  ////////////function signup /////////////////
  signup() {
    //InputValidator();
    print('*******************signup*********************');
    Map<String, dynamic> data = {
      //
      // 'fullname': 'rr',

      'username': usernameController.text,

      'email': emailController.text,
      'password': passwordController.text,
      'items': AccountInfoStorage.readItems(),
      //  'city': 'r',
      //  'adress': '',
      // 'phone': '',
//      'image': '1696502272953-Happy Birthday 2023 (1).png',
      // 'events': '',
    };
    apisignup.postData(data).then((value) {
      print('success');

      userJson = value as UserGetByIdJson?;
      print('id user==========> ${userJson!.data!.sId}');
      print('role user==========> ${userJson!.data!.items}');
      AccountInfoStorage.saveImage(userJson!.data!.image);

      print('role image==================> ${AccountInfoStorage.readImage()}');

      print('success');
      if (userJson!.data!.items == "Customer") {
        print('Customer');
        Get.to(HomeView());
      } else if (userJson!.data!.items == "Vendor") {
        print('Vendor');

        Get.to(HomeViewVendor());
      } else {
        Get.to(HomeViewAdmin());
      }
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
  }

////////////function getinfouser /////////////////

  getUserById() {
    apiUserById.id = AccountInfoStorage.readId().toString();

    apiUserById.getData().then((value) {
      userGetByIdJson = value as UserGetByIdJson?;
      usernameController.text = userGetByIdJson!.data!.username!;
      emailController.text = userGetByIdJson!.data!.email!;
      adresseController.text = userGetByIdJson!.data!.adress!;
      phonenumberController.text = userGetByIdJson!.data!.phone!.toString();
    });
  }

////////////function updateinfouser /////////////////
  userUpdate() {
    apiUserById.id = AccountInfoStorage.readId().toString();
    AccountInfoStorage.readImage().toString();
    dio.FormData data = dio.FormData.fromMap({
      //'items': 'Customer',
      'username': usernameController.text,
      'email': emailController.text,
      //'password': passwordController.text,
      //'city': 'r',
      'adress': adresseController.text,
      'phone': phonenumberController.text,
      'image': "1696502272953-Happy Birthday 2023 (1).png",
      // 'events': '',
    });

    apiUserById.updateData(data).then((value) {
      print("success");
      // Get.defaultDialog(title: "Alert");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Notification Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
  }

  updatepasswordUser() {
    dio1.patch(AppApi.updatePasswordUrl,
        data: {"password": passwordController.text}).then((value) {
      print("success");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Passowrd Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
  }

  resetpasswordUser() {}

  @override
  void onInit() {
    //logOut();

    //createEvent();
    // Initialisations spécifiques à ce contrôleur
    super
        .onInit(); // N'oubliez pas d'appeler super.onInit() pour respecter le cycle de vie de GetX.
  }

  logOut() {
    dio1.options.headers['authorization'] =
        'bearer ${AccountInfoStorage.readTokenUser().toString()}';
    dio1
        .get("http://localhost:3000/auth/logout")
        .then((value) => print('logout success'))
        .onError((error, stackTrace) => print("erro logout ====> $error"));
  }

  //////////////////////////////image upload by cloudinary ///////////////////////////////////////
  /// https://cyuket.medium.com/flutter-how-to-upload-to-cloudinary-cdb7631dfbe1 ///
}
