import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custom_text_password.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool valuefirst = true;
  bool valuesecond = false;
  bool valuetherd = false;
  bool valueFour = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ProfileColntroller controller = ProfileColntroller();
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
              text: 'Setting',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextPassword(
                    text: "Old password",
                    obscureText: false,
                    //controller.isVisiblePassword,
                    controller: controller.oldpasswordController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        print('input is empty');
                        return controller.oldpasswordController.text;
                      }
                      if (AccountInfoStorage.readPassword() !=
                          controller.oldpasswordController.text) {
                        print(
                            "Old password do not match ${controller.oldpasswordController.text}");
                        return 'Old password do not match';
                      }
                      return null;
                    },
                  ),
                  CustomTextPassword(
                    obscureText: controller.isVisiblePassword,
                    text: "New Password",
                    controller: controller.newpasswordcontroller,
                    iconData: controller.isVisiblePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    function: () {
                      print("${controller.newpasswordcontroller}");

                      print('********click password*********');
                      controller.showPassword();
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'chek your password';
                      }
                      if (input.length < 6) {
                        return 'password must b >6';
                      }
                      return null;
                    },
                  ),
                  CustomTextPassword(
                    text: "Confirm new Password",
                    controller: controller.confirmPasswordController,
                    iconData: controller.isVisiblePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: controller.confirmPassword,
                    validator: (input) {
                      if (controller.confirmPasswordController.text !=
                          controller.newpasswordcontroller.text) {
                        print("pass do not match");
                        return 'pass do not match';
                      }
                      return null;
                    },
                    function: () {
                      controller.showConfirmPassword();
                    },
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /*  print(
                                          "password ========================= ${controller.newpasswordcontroller.text}");
                                      print(
                                          "confirmpassword ========================= ${controller.confirmPasswordController.text}");*/
                    print('validate form password++++++++++++++++++++++');
            //        controller.InputValidator();

                    controller.updatepasswordUser();
                  }
                },
                child: Text("update"))
          ],
        ),
      ),
    );
  }
}
