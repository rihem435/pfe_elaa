import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class GuestList extends GetView<EventController> {
  //final List<ListItem> items;

  const GuestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    //controller.getAllGuestsByEventId();
    // controller.getGuests();
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
              text: 'My Guest list',
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



             ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                          scrollDirection: Axis.vertical,
                        itemCount: controller.guestByEventIdJson!.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              CustomText(
                                  text:"test"),// AccountInfoStorage.readGuestName().toString()),
                              CustomText(
                                  text:
                                     "test"),// AccountInfoStorage.readGuestPhonenumber().toString()),
                            ],
                          );
                        },
                      ),
      /*       FutureBuilder(
              future: controller.getAllGuestsByEventId(),
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("-----------------snapshot$snapshot");
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.secondary),
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
                        'Guest',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return Expanded(
                      flex: 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                          scrollDirection: Axis.vertical,
                        itemCount: controller.guestByEventIdJson!.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              CustomText(
                                  text:"test"),// AccountInfoStorage.readGuestName().toString()),
                              CustomText(
                                  text:
                                     "test"),// AccountInfoStorage.readGuestPhonenumber().toString()),
                            ],
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
       */    ],
        ),
      ),

      // New event button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.secondary,
        foregroundColor: Colors.white,
        // icon: Icon(Icons.add_outlined),
        label: Text('New Guest'),
        onPressed: () {
          Get.dialog(AlertDialog(
            title:
                Text("New Guest", style: TextStyle(color: AppColor.goldColor)),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //guest name
                  CustomInputText(
                    controller: controller.guestNameConroller,
                    obscureText: false,
                    label: "Name:",
                  ),
                  //phone number
                  CustomInputText(
                    controller: controller.guestPhonenumberConroller,
                    obscureText: false,
                    label: "Phone Number:",
                  ),
                  //True or false boolean for the invitaion
                  /* CustomInputText(
                    controller: controller.guestInvitedConroller,
                    obscureText: false,
                    label: "",
                  ), */
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
                      controller.createGuests();
                      Get.to(GuestList());
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
/* ListView.builder(
                itemCount: controller.guestByEventIdJson!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CustomText(
                        text: controller.guestByEventIdJson!.data![index].name
                            .toString()),
                    subtitle: CustomText(
                        text: controller
                            .guestByEventIdJson!.data![index].phonenumber
                            .toString()),
                  );
                },
              ), 
              */


