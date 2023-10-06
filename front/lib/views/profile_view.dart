import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_image_change.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/state_manager.dart';

GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

class ProfileView extends GetView<ProfileColntroller> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserById();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
              //code to execute when this button is pressed
            }),
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                text: ' Profile',
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          /*    mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
         */
          children: [
            Expanded(
              flex: 0,
              child: Container(
                child: Stack(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //chat Box with Vendors
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColor.goldColor,
                                child: Icon(
                                  Icons.chat,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              // profile pic
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      child: CustomImageChange(
                                        function: () {},
                                      ),
                                    ),
                                    //get name from backend
                                    Expanded(
                                      flex: 0,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            color: AppColor.goldColor
                                                .withOpacity(1),
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // phone number
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColor.goldColor,
                                child: Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CustomInputText(
                      label: 'User Name',
                      iconData: Icons.person,
                      obscureText: false,
                      controller: controller.usernameController,
                    ),
                  ),
                  Expanded(
                    child: CustomInputText(
                      label: 'Email',
                      iconData: Icons.email,
                      obscureText: false,
                      controller: controller.emailController,
                    ),
                  ),
                  Expanded(
                    child: CustomInputText(
                      label: 'Phone number',
                      iconData: Icons.phone,
                      obscureText: false,
                      controller: controller.phonenumberController,
                    ),
                  ),
                  Expanded(
                    child: CustomInputText(
                      label: 'Adresse',
                      iconData: Icons.location_city,
                      obscureText: false,
                      controller: controller.adresseController,
                    ),
                  ),
                  Expanded(
                    child: CustomInputText(
                      label: 'password',
                      iconData: Icons.location_city,
                      obscureText: false,
                      controller: controller.passwordController,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Update',
              width: 100,
              height: 40,
              function: () {
                // controller.userUpdate();
                print("alert dialog");
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirme changes"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            controller.userUpdate();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );

                //  controller.updatepasswordUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
