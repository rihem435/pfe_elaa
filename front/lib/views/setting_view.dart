import 'package:flutter/material.dart';
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
            widget: Center(
                child: Expanded(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /*               ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text("Change USername"),
                                  content: TextFormField(
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'New Username',
                                      border: OutlineInputBorder(),
                                      prefixIcon:
                                          Icon(Icons.drive_file_rename_outline),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child:   Text('Cancel'),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'UPDATE');
                                      },
                                      child:   Text('UPDATE'),
                                    ),
                                  ],
                                ));
                      },
                      style:
                          ElevatedButton.styleFrom(primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Change Username',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.person)
                          ],
                        ),
                      ),
                    ),
                     
                           */
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: AppColor.secondary,
                                  title: Text("Change Password "),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextPassword(
                                          text: "Old password",
                                          obscureText: false,
                                          //controller.isVisiblePassword,
                                          controller:
                                              controller.oldpasswordController,
                                          validator: (input) {
                                            if (input!.isEmpty ) {
                                              print('input is empty');
                                              return controller.oldpasswordController.text;
                                            }
                                            if (controller
                                                    .passwordController.text !=
                                                controller.oldpasswordController
                                                    .text) {
                                              print(
                                                  "Old password do not match ${controller.oldpasswordController.text}");
                                              return 'Old password do not match';
                                            }
                                            return null;
                                          },
                                        
                                      ),
                                                                GetBuilder<ProfileColntroller>(
                                          builder: (controller) {
                                        return CustomTextPassword(
                                          obscureText:
                                              controller.isVisiblePassword,
                                          text: "New Password",
                                          controller:
                                              controller.newpasswordcontroller,
                                          iconData: controller.isVisiblePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          function: () {
                                            print(
                                                "${controller.newpasswordcontroller}");

                                            print(
                                                '********click password*********');
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
                                        );
                                      }),
                                      GetBuilder<ProfileColntroller>(
                                          builder: (controller) {
                                        return CustomTextPassword(
                                          text: "Confirm new Password",
                                          controller: controller
                                              .confirmPasswordController,
                                          iconData: controller.isVisiblePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          obscureText:
                                              controller.confirmPassword,
                                          validator: (input) {
                                            if (controller
                                                    .confirmPasswordController
                                                    .text !=
                                                controller.newpasswordcontroller
                                                    .text) {
                                              print("pass do not match");
                                              return 'pass do not match';
                                            }
                                            return null;
                                          },
                                          function: () {
                                            controller.showConfirmPassword();
                                          },
                                        );
                                      }),
              
                                    ],
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        print(
                                            '****************function updatepassword**************');
                                        if (formKey.currentState!.validate()) {
                                          /*  print(
                                              "password ========================= ${controller.newpasswordcontroller.text}");
                                          print(
                                              "confirmpassword ========================= ${controller.confirmPasswordController.text}");
 */
                                          print(
                                              'validate form password++++++++++++++++++++++');
                                          //   controller.InputValidator();

                                          controller.updatepasswordUser();
                                        }
                                        //Navigator.pop(context, 'UPDATE');
                                      },
                                      child: Text('UPDATE'),
                                    ),
                                  ],
                                ));
                      },
                      style:
                          ElevatedButton.styleFrom(primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.vpn_key_outlined)
                          ],
                        ),
                      ),
                    ),
                    /*                      ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Change Info '),
                            content: TextFormField(
                              onChanged: (value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                labelText: ' Information',
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.drive_file_rename_outline),
                              ),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child:   Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'UPDATE');
                                },
                                child:   Text('UPDATE'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Change  Info ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.contact_page_outlined)
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Change Phone Number'),
                            content: TextFormField(
                              onChanged: (value) {
                                print(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.drive_file_rename_outline),
                              ),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child:   Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'UPDATE');
                                },
                                child:   Text('UPDATE'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Change Phone Number ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.contact_page_outlined)
                          ],
                        ),
                      ),
                    ),
                    */

                    ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.message_outlined)
                          ],
                        ),
                      ),
                    ),

                    /*    ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => RatingDialog(
                              title: Text('Rating'),
                              message: Text('Please rate our application'),
                              image:   FlutterLogo(size: 100),
                              initialRating: 4,
                              submitButtonText: 'Submit',
                              enableComment: false,
                              onCancelled: () {},
                              onSubmitted: (response) {
                                print(
                                    'rating: ${response.rating}, comment: ${response.comment}');
                              }));
                    },
                    style: ElevatedButton.styleFrom(primary: AppColor.goldColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Rate Us',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.star_border_outlined)
                        ],
                      ),
                    ),
                    ),
                    */
                    ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Change Language '),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColor.goldColor,
                                      activeColor: AppColor.secondary,
                                      value: valuefirst,
                                      onChanged: (value) {
                                        setState(() {
                                          valuefirst = value!;
                                        });
                                      },
                                    ),
                                    Text("English"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColor.goldColor,
                                      activeColor: AppColor.secondary,
                                      value: valuesecond,
                                      onChanged: (value) {
                                        setState(() {
                                          valuesecond = value!;
                                        });
                                      },
                                    ),
                                    Text("العربية"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColor.goldColor,
                                      activeColor: AppColor.secondary,
                                      value: valuetherd,
                                      onChanged: (value) {
                                        setState(() {
                                          valuetherd = value!;
                                        });
                                      },
                                    ),
                                    Text("Turkish"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColor.goldColor,
                                      activeColor: AppColor.secondary,
                                      value: valueFour,
                                      onChanged: (value) {
                                        setState(() {
                                          // valueFour !=valuefirst ?valueFour=true:valuefirst=false;
                                        });
                                      },
                                    ),
                                    Text("FRENCH"),
                                  ],
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context, 'UPDATE');
                                },
                                child: Text('UPDATE'),
                              ),
                            ],
                          ),
                        );
                      },
                      style:
                          ElevatedButton.styleFrom(primary: AppColor.goldColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Change Language ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.contact_page_outlined)
                          ],
                        ),
                      ),
                    ),

                    /*          ElevatedButton(
                    onPressed: () {
                      AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              headerAnimationLoop: false,
                              animType: AnimType.TOPSLIDE,
                              title: 'Warning',
                              desc: 'Are you sure you want to Signout',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {})
                          .show();
                    },
                    style: ElevatedButton.styleFrom(primary: AppColor.goldColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Signout ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.outbond_outlined)
                        ],
                      ),
                    ),
                    ),
                      */
                  ],
                ),
              ),
            ))));
  }
}
