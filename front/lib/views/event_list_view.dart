import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/views/guest-list.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_dropdown_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custum_event_list.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:get/get.dart';

class EventListView extends GetView<EventController> {
  EventListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    controller.getAllEventByUserId();
    //  controller.getEventById(AccountInfoStorage.saveEventId(controller.eventByIdJson!.data!.sId.toString()));
    //controller.createEvent();
    //controller.formattedate("${controller.eventsJson!.message}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          /*     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          */
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'My events',
            ),
          ],
        ),
      ),

      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(
              text: "Hello, ${AccountInfoStorage.readName().toString()}!",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            CustomText(
              text: "Let's explore what’s happening nearby",
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),

            /// Events

            FutureBuilder(
                future: controller.getAllEventByUserId(),
                builder: (ctx, snapshot) {
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("-----------------snapshot$snapshot");
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColor.secondary),
                    );
                  } else {
                    // If we got an error
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: TextStyle(fontSize: 18),
                        ),
                      );

                      // if we got our data
                    }

                    if (snapshot.data == null) {
                      // Extracting data from snapshot object
                      print(
                          '-----------------------snapshotdata=======>$snapshot');
                      return Center(
                        child: Text(
                          'Create you first event. Make it memorable with our services',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return Expanded(
                        flex: 1,
                        child: GetBuilder<EventController>(
                          builder: (controller) {
                            return ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    controller.eventByUserIdJson!.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  AccountInfoStorage.saveEventId(controller
                                      .eventByUserIdJson!.data![index].sId
                                      .toString());
                                  controller.getAllGuestsByEventId();
                                  return GestureDetector(
                                      child: CustomEventList(
                                        text:
                                            "${controller.eventByUserIdJson!.data![index].guests!.length}",
                                        eventName:
                                            "${controller.eventByUserIdJson!.data![index].titleevent}",
                                        datedeb:
                                            "${controller.eventByUserIdJson!.data![index].dateDebut}",
                                        datefin:
                                            "${controller.eventByUserIdJson!.data![index].dateFin}",
                                        local:
                                            "${controller.eventByUserIdJson!.data![index].local}",
                                        budget:
                                            "${controller.eventByUserIdJson!.data![index].budget}",
                                        /*                  getlistguest: Expanded(
                                        child: Column(
                                          children: [
                                            CustomText(text: "Guest List:"),
                                            GetBuilder<EventController>(
                                                builder: (controller) {
                                              return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: 1,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return TextButton(
                                                        onPressed: () {
                                                          controller.getEventById(
                                                              controller
                                                                  .eventByIdJson!
                                                                  .data!
                                                                  .sId
                                                                  .toString());
                                                          Get.to(GuestList());
                                                        },
                                                        child: Text(
                                                          controller
                                                              .guestByEventIdJson!
                                                              .data!
                                                              .length
                                                              .toString(),
                                                        ));
                                                  });
                                            }),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                            */
                                        colorBorder: AppColor.goldColor,
                                        widthBorder: 1,
                                        function: () {},
                                      ),
                                      onTap: () {
                                        print(
                                            "////////////////////////////////////////event by id to get guest user////////////////////////////////////////");

                                        controller.getEventById(
                                            "${AccountInfoStorage.readEventId()}");

                                        Get.to(GuestList());
                                      });
                                });
                          },
                        ),
                      );
                    }
                  }
                }),
          ],
        ),
      ),

      // New event button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.secondary,
        foregroundColor: Colors.white,
        // icon: Icon(Icons.add_outlined),
        label: Text('New Event'),
        onPressed: () {
          Get.dialog(AlertDialog(
            title:
                Text("New event", style: TextStyle(color: AppColor.goldColor)),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //event title
                  CustomInputText(
                    controller: controller.eventTitleController,
                    obscureText: false,
                    label: "Event Title:",
                  ),
                  //description
                  CustomInputText(
                    controller: controller.descriptionController,
                    obscureText: false,
                    label: "Description",
                  ),
                  //location dropdownlist
                  CustomInputText(
                    controller: controller.budgetController,
                    obscureText: false,
                    label: "Budget:",
                  ),
                  //Dates begin and last
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.secondary)),
                    child: Text('Pick event first and end date'),
                    onPressed: () {
                      controller.openRangeDatePicker(context);
                      Text(" ${controller.dateDebutController.text}");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Location
                  CustomDropdownList(),
                ],
              ),
            ),
            actions: <Widget>[
              GetBuilder<EventController>(
                builder: (controller) {
                  return TextButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.secondary, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.createEvent();
                      Get.to(EventListView());
                      Navigator.of(context).pop();
                    },
                  );
                },
              )
            ],
          ));
        },
      ),
    );
  }
}
