import 'package:front/config/storage.dart';

class AccountInfoStorage {
  static const keyTokenUser = "tokenUser";

  static const keyId = "id";
  static const keyname = "name";
  static const keyemail = "email";
  static const keyitems = "items";
  static const Keyimage = "image";

  static const keyproductId = "productId";
  static const keyprodcutName = "prodcutName";
  static const keyprodcutPrice = "prodcutPrice";
  static const keyprodcutImage = "prodcutImage";
  static const keyprodcutDescription = "prodcutDescription";
  static const keyproductLocal = "productLocal";

  static const keycategorieId = "categorieId";
  static const keycategorieName = "categorieName";
  static const keycategorieProduct = "categorieProduct";

  static const keyeventId = "eventId";
  static const keyeventTitle = "eventTitle";
  static const keyeventDescription = "eventDescription";
  static const keyeventDatedebut = "eventDatedebut";
  static const keyeventDatefin = "eventDatefin";
  static const keyeventLocation = "eventLocation";

  static saveTokenUser(String? tokenUser) {
    SecureStorage.writeSecureData(key: keyTokenUser, value: tokenUser!);
  }

  static String? readTokenUser() {
    return SecureStorage.readSecureData(keyTokenUser);
  }

  static saveId(String id) {
    SecureStorage.writeSecureData(key: keyId, value: id);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keyId);
  }

  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyname, value: name);
  }

  static String? readName() {
    return SecureStorage.readSecureData(keyname);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyemail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyemail);
  }

  static saveItems(String? items) {
    SecureStorage.writeSecureData(key: keyitems, value: items!);
  }

  static String? readItems() {
    return SecureStorage.readSecureData(keyitems);
  }

  static saveImage(String? image) {
    SecureStorage.writeSecureData(key: Keyimage, value: image!);
  }

  static String? readImage() {
    return SecureStorage.readSecureData(Keyimage);
  }

  static saveProductId(String? productId) {
    SecureStorage.writeSecureData(key: keyproductId, value: productId!);
  }

  static String? readProductId() {
    return SecureStorage.readSecureData(keyproductId);
  }

  static saveProductName(String? prodcutName) {
    SecureStorage.writeSecureData(key: keyprodcutName, value: prodcutName!);
  }

  static String? readProductName() {
    return SecureStorage.readSecureData(keyprodcutName);
  }

  static saveProductPrice(String? prodcutPrice) {
    SecureStorage.writeSecureData(key: keyprodcutPrice, value: prodcutPrice!);
  }

  static String? readProductPrice() {
    return SecureStorage.readSecureData(keyprodcutPrice);
  }

  static saveProductImage(String? prodcutImage) {
    SecureStorage.writeSecureData(key: keyprodcutImage, value: prodcutImage!);
  }

  static String? readProductImage() {
    return SecureStorage.readSecureData(keyprodcutImage);
  }

  static saveProductDescription(String? prodcutDescription) {
    SecureStorage.writeSecureData(
        key: keyprodcutDescription, value: prodcutDescription!);
  }

  static String? readProductDescription() {
    return SecureStorage.readSecureData(keyprodcutDescription);
  }

 static saveProductLocal(String? productLocal) {
    SecureStorage.writeSecureData(
        key: keyproductLocal, value: productLocal!);
  }

  static String? readProductLocal() {
    return SecureStorage.readSecureData(keyproductLocal);
  } 

  static saveCatgorieName(String? categorieName) {
    SecureStorage.writeSecureData(key: keycategorieName, value: categorieName!);
  }

  static String? readCategorieName() {
    return SecureStorage.readSecureData(keycategorieName);
  }

  static saveCatgorieId(String? categorieId) {
    SecureStorage.writeSecureData(key: keycategorieId, value: categorieId!);
  }

  static String? readCategorieId() {
    return SecureStorage.readSecureData(keycategorieId);
  }

  static saveCatgorieProducts(String? categorieProducts) {
    SecureStorage.writeSecureData(
        key: keycategorieProduct, value: categorieProducts!);
  }

  static String? readCategorieProducts() {
    return SecureStorage.readSecureData(keycategorieProduct);
  }
}
