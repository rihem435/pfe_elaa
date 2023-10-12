import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';


class CustomBoxDetail extends StatelessWidget {
  final Function? function;
  const CustomBoxDetail({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 1,
          color: AppColor.goldColor.withOpacity(0.1),
        ),
        shape: BoxShape.rectangle,
      ),

      //icons
      child: Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shopping_cart
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.bookmark_add,
                    color: AppColor.goldColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Add to Event",
                  textAlign: TextAlign.center,
                )
              ],
            ),
            //message
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.message_rounded,
                    color: AppColor.goldColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Massage Vendor",
                  textAlign: TextAlign.center,
                )
              ],
            ),
            //favorite
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColor.goldColor,
                    size: 30,
                  ),
                  onPressed: () {
                  },
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Favorite",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
