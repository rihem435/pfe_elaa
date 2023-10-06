import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomDropdownServices extends StatelessWidget {
  const CustomDropdownServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Services categorie",
          style: TextStyle(color: Colors.black54, fontSize: 18),
        ),
        DropdownButton<String>(
          style: TextStyle(fontSize: 16, color: AppColor.goldColor),
          dropdownColor: Colors.white,
          underline: Container(
            height: 1,
            width: 400,
            color: AppColor.goldColor,
          ),
          iconEnabledColor: AppColor.goldColor,
          items: <String>['Tunis', 'Ariana', 'Mannouba' /* get services list */].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black54),
              ),
            );
          }).toList(),
          onChanged: (value) {
            value = value;
            Text(
              '$value',
              style: TextStyle(color: AppColor.blackColor),
            );
            print(value);
          },
        ),
      ],
    );
  }
}
