import 'package:flutter/material.dart';
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
    controller.getAllGuestsByEventId();
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
            FutureBuilder(
              future: controller.getAllGuestsByEventId(),
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("-----------------snapshot$snapshot");
                  return Center(
                      child:
                          CircularProgressIndicator(color: AppColor.secondary));
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
                        'Invite Guests and make sure to make memorible mimories with your beloved!',
                        style: TextStyle(
                          color: AppColor.goldColor,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: GetBuilder<EventController>(
                        builder: (controller) {
                          return Text(
                              "${controller.guestByEventIdJson!.data![0].events}");
                        },
                      ),
                    );
                  }
                }
              },
            ),
            /*           controller.getAllGuestsByEventId(),
            Text("${controller.guestByEventIdJson!.data![0].events}"),
       */ /*         FutureBuilder(
                future: controller.getGuests(),
                builder: (ctx, snapshot) {
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("-----------------snapshot$snapshot");
                    return Center(
                        child: CircularProgressIndicator(
                            color: AppColor.secondary));
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
                          style: TextStyle(
                            color: AppColor.goldColor,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          child: GetBuilder<EventController>(
                              builder: (controller) {
                            return ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.guestGetAllJson!.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                 // controller.getAllGuestsByEventId();
                                  return Text(
                                        'test',//'${controller.guestByEventIdJson!.data![index].name}',
                                   
                                  );
                                });
                          }));
                    }
                  }
                }),
     */
          ],
        ),
      ),

      // New event button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.secondary,
        foregroundColor: Colors.white,
        // icon: Icon(Icons.add_outlined),
        label: Text('New guest'),
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
                itemCount: controller.guestByUserIdJson!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CustomText(
                        text: controller.guestByUserIdJson!.data![index].name
                            .toString()),
                    subtitle: CustomText(
                        text: controller
                            .guestByUserIdJson!.data![index].phonenumber
                            .toString()),
                  );
                },
              ), */


