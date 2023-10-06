import 'package:flutter/cupertino.dart';
import 'package:front/config/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key, this.text, this.fontSize, this.fontWeight, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      maxLines: 22,
      softWrap: true,
      style: TextStyle(
        color: AppColor.goldColor,
        fontFamily: 'Inter',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
