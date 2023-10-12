import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/models/json/event_by_id_json.dart';
import 'package:front/models/json/event_by_user_id_json.dart';
import 'package:front/models/json/event_get_json.dart';
import 'package:front/models/json/event_json.dart';
import 'package:front/models/json/guest_all_json.dart';
import 'package:front/models/json/guest_by_event_id_json.dart';
import 'package:front/models/json/guest_by_user_id_json.dart';
import 'package:front/models/json/guest_json.dart';
import 'package:front/models/network/api_event_create.dart';
import 'package:front/models/network/api_event_get.dart';
import 'package:front/models/network/api_event_get_by_id.dart';
import 'package:front/models/network/api_events_get_by_user_id.dart';
import 'package:front/models/network/api_guest_add.dart';
import 'package:front/models/network/api_guest_get.dart';
import 'package:front/models/network/api_guest_get_by_event_id.dart';
import 'package:front/models/network/api_guest_get_by_user_id.dart';
import 'package:front/views/event_list_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

class EventController extends GetxController {
  ApiEventGet apiEventGet = ApiEventGet();
  ApiEventGetById apiEventGetById = ApiEventGetById();
  ApiEventCreate apiEventCreate = ApiEventCreate();
  ApiEventGetByUserId apiEventGetByUserId = ApiEventGetByUserId();

  ApiGuestsGetByUserId apiGuestsGetByUserId = ApiGuestsGetByUserId();
  ApiGuestsGetByEventId apiGuestsGetByEventId = ApiGuestsGetByEventId();
  ApiGuestCreate apiGuestCreate = ApiGuestCreate();
  ApiGuestsGet apiGuestsGet = ApiGuestsGet();

  EventJson? eventJson;
  EventGetJson? eventGetJson;
  EventByIdJson? eventByIdJson;
  EventByUserIdJson? eventByUserIdJson;

  GuestByEventIdJson? guestByEventIdJson;
  GuestByUserIdJson? guestByUserIdJson;
  GuestGetAllJson? guestGetAllJson;
  GuestJson? guestJson;

  TextEditingController eventTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  TextEditingController guestNameConroller = TextEditingController();
  TextEditingController guestPhonenumberConroller = TextEditingController();
  TextEditingController guestInvitedConroller = TextEditingController();

  void viderControllers() {
    dateDebutController.text = '';
    dateFinController.text = '';
  }

  @override
  void onInit() {
    getEvents();
    print(
        '************************************create event**********************');
    //createEvent();
    // Initialisations spécifiques à ce contrôleur
    super
        .onInit(); // N'oubliez pas d'appeler super.onInit() pour respecter le cycle de vie de GetX.
  }

  getEvents() {
    return apiEventGet.getData().then((value) {
      print("success get Events");
      eventGetJson = value as EventGetJson?;

      print("data events ======================= ${eventGetJson!.status}");
      if (eventGetJson!.data != null) {
        return eventGetJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return eventGetJson;
    });
  }

  getAllEventByUserId() {
    print("Events by user id ---------------------");
    apiEventGetByUserId.id = AccountInfoStorage.readId().toString();
    return apiEventGetByUserId.getData().then((value) {
      print('value===========> $value');
      eventByUserIdJson = value as EventByUserIdJson?;
      print("Events message =============== ${eventByUserIdJson!.message}");
      if (eventByUserIdJson!.data!.isNotEmpty) {
        print(
            'events==========================> ${eventByUserIdJson!.data!.length}');
        return eventByUserIdJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  }

  String? getEventById(String id) {
    print('category by id-----------------------');
    apiEventGetById.id = id;
    apiEventGetById.getData().then((value) {
      eventByIdJson = value as EventByIdJson?;
      print(
          "data event by id=================== ${eventByIdJson!.data!.dateDebut}");
      return "${eventByIdJson!.data!.dateDebut}";
    }).onError((error, stackTrace) {
      print('error======> $error');
      return "error";
    });
    //  return null;

    return null;
  }

  String formattedate(String date) {
    DateTime saved = DateTime.parse(date);
    // print("data saved by id=================== $saved");
    String formattedDate = DateFormat('dd-MM-yyyy').format(saved);
    //print("formattedDate $formattedDate");
    return formattedDate;
  }

  openRangeDatePicker(BuildContext context) {
    BottomPicker.range(
      title: 'Set date range',
      description: 'Please select a first date and an end date',
      dateOrder: DatePickerDateOrder.dmy,
      minFirstDate: DateTime.now(),
      initialFirstDate: DateTime.now().add(Duration(days: 1)),
      pickerTextStyle: TextStyle(
        color: AppColor.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: AppColor.goldColor,
      ),
      descriptionStyle: TextStyle(
        color: AppColor.goldColor,
      ),
      onSubmitPressed: (firstDate, secondDate) {
        formattedate("$firstDate");
        formattedate("$secondDate");

        dateDebutController.text = firstDate.toString();
        dateFinController.text = secondDate.toString();
        print(firstDate);
        print(secondDate);
        //return Text("${formattedate("$firstDate")}${formattedate("$firstDate")}");
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      buttonSingleColor: AppColor.goldColor,
    ).show(context);
  }

  ////////////test event /////////////////

  createEvent() {
    print('************************create event***********************');
    AccountInfoStorage.readTokenUser();

    print("access token ${AccountInfoStorage.readTokenUser()}");
    Map<String, dynamic> data = {
      "titleevent": eventTitleController.text,
      "description": descriptionController.text,
      "date_debut": dateDebutController.text,
      "date_fin": dateFinController.text,
      "local": AccountInfoStorage.readProductLocal().toString(),
      "budget": budgetController.text,
      "user": AccountInfoStorage.readId(),
    };
    print(
        'token--------------------->${AccountInfoStorage.readTokenUser().toString()}');
    apiEventCreate.token = AccountInfoStorage.readTokenUser().toString();
    //   saveData(dateDebutController.text, dateFinController.text);
    apiEventCreate.postData(data).then((value) {
      print('success+++++++++++++++> $value');
      eventJson = value as EventJson?;
      AccountInfoStorage.saveEventId(eventJson!.data!.sId.toString());

      getEvents();
      print('event created=======> ${eventJson!.data!.sId}');

      Get.to(EventListView());
      update();
    }).onError((error, stackTrace) {
      print('error create event ==========> $error');
    });
  }

  final formData = FormData({
    'name': 'dio',
    'date': DateTime.now().toIso8601String(),
  });

//////////////////////Guest list
  ///
  createGuests() {
    print('************************create guest***********************');

    Map<String, dynamic> data = {
      "name": guestNameConroller.text,
      "phonenumber": guestPhonenumberConroller.text.toString(),
      "invited": true,
      "events": AccountInfoStorage.readEventId(),
    };

    print("guest data =============== $data");
    apiGuestCreate.postData(data).then((value) {
      print('success+++++++++++++++> $value');
      guestJson = value as GuestJson?;
      getEvents();
      print('Guest created=======> ${guestJson!.data!.sId}');
      // getGuests();
      update();
    }).onError((error, stackTrace) {
      print('error create event ==========> $error');
    });
  }

  getAllGuestsByEventId() {
    print("Guest by Event id ---------------------");
    apiGuestsGetByEventId.id = AccountInfoStorage.readEventId().toString();
    return apiGuestsGetByEventId.getData().then((value) {
      print(
          "id evnet by Event id ================ ${guestByEventIdJson!.data![0].events}");
      print(
          'Guest by Event id ==========================> ${guestByEventIdJson!.data!.length}');

      print('value by Event id ===========> $value');
      guestByEventIdJson = value as GuestByEventIdJson?;
      print("Guest message =============== ${guestByEventIdJson!.data}");
      if (guestByEventIdJson!.data != null) {
        return guestByEventIdJson;
      }
      return null;
      /* if (guestByEventIdJson!.data!.isNotEmpty) {
        print(
            'Guest==========================> ${guestByEventIdJson!.data!.length}');
        return guestByEventIdJson;
      }

      return guestByEventIdJson; */
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  }

  getGuests() {
    return apiGuestsGet.getData().then((value) {
      print(
          "====================================================================================================================================================================================success get Guests");
      guestGetAllJson = value as GuestGetAllJson?;
      print(
          "get event guest message ================= ${guestGetAllJson!.message}");
      print(
          'Guest==========================> ${guestGetAllJson!.data!.length}');

      print("data Guests ======================= ${guestGetAllJson!.status}");
      if (guestGetAllJson!.data != null) {
        return guestGetAllJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return guestGetAllJson;
    });
  }
}
