import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';

class CustomTextPassword extends StatelessWidget {
  final IconData? iconData;
  final Function? function;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String text;

  const CustomTextPassword(
      {Key? key,
      this.iconData,
      this.function,
      this.validator,
      this.controller,
      required this.obscureText,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        controller: controller!,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.drive_file_rename_outline),
          suffixIcon: IconButton(
            icon: Icon(
              iconData,
              color: AppColor.goldColor,
            ),
            onPressed: () {
              function!();
            },
          ),
        ),
        style: TextStyle(color: Colors.black),
        obscureText: obscureText,
        validator: validator,
        //    autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
