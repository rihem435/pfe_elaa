import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';

class CustumSalesServices extends StatelessWidget {
  final String text1;
  final String text;
  final String productnumber;
  final String price;
  final Function function;

  const CustumSalesServices(
      {Key? key,
      required this.text1,
      required this.text,
      required this.productnumber,
      required this.price,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Expanded(flex: 2,child: CustomText(fontSize: 18, fontWeight: FontWeight.w300, text: '$text1'),),
          SizedBox(width: 40),
          Expanded(
            child: CustomText(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                text: '$productnumber'),
          ),
        //  SizedBox(width: 30),
          Expanded(
            child: CustomText(
                fontSize: 18, fontWeight: FontWeight.w300, text: '$price dt'),
          ),
          //SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(10, 10),
                backgroundColor: AppColor.goldColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                function!();
              },
              child: Icon(Icons.arrow_right_rounded)!,
            ),
          ),
        ],
      ),
    );
  }
}
