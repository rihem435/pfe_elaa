import 'package:front/config/account_info_storage.dart';

class AppApi {
    static const String baseUrl = "http://$ip/";

 // static const String ip = "192.168.2.36:3000";
  //static const String ip = "localhost:3000";
 static const String ip = "192.168.1.11:3000";

  static const String loginUrl = "${baseUrl}auth/signin";
  static const String signupUrl = "${baseUrl}users/";
  static const String getUserByIdUrl = "${baseUrl}users/";
  static String updatePasswordUrl =
      "${baseUrl}auth/updatepassword/${AccountInfoStorage.readId().toString()}";
  //static const String getImageUser = "${baseUrl}file/users/";

  static const String getEventByUserUrl = "${baseUrl}events/user/";
  static const String createEventUrl = "${baseUrl}events/";
  static const String getEventUrl = "${baseUrl}events/";

  static const String createFactureUrl = "${baseUrl}factures/";

  static const String getCategoriesUrl = "${baseUrl}categories/";
  static const String getCategorieByNameUrl = "${baseUrl}categories/getbyname";

  static const String createProductsUrl = "${baseUrl}products";
  static const String getProductsUrl = "${baseUrl}products/";
  static const String getProductsByUserUrl = "${baseUrl}products/user";

  static const String createGuestUrl = "${baseUrl}guests";
  static const String getGuestsUrl = "${baseUrl}guests/";
  static const String getGuestsByUserIdUrl = "${baseUrl}guests/user";
  static const String getGuestsByEventIdUrl = "${baseUrl}guests/event/";

  static const String Logout = "${baseUrl}auth/logout";

  /* 
  String baseUrlCloudinary =
      'https://API Key:872948247576765 _Rl01bDk9GpGQnjqM_YSsLNT2bQ@api.cloudinary.com/v1_1/elaa/resources/image';
 */
}
