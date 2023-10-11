import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:get/get.dart';

class CustomProductListV extends GetView<ProductsController> {
  final String? productName, categorie;
  final String? description, local, price;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;

  CustomProductListV({
    Key? key,
    this.productName,
    this.categorie,
    this.price,
    this.function,
    this.widthBorder,
    this.colorBorder,
    this.description,
    this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScrollController scrollController = ScrollController();

    return Padding(
      padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: colorBorder!, width: widthBorder!),
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(18), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(80), // Image radius
                child: Image(
                    image: AssetImage("assets/images/landpage.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //product title
                AutoSizeText(
                  '$productName',
                  overflow: TextOverflow.ellipsis,
                  presetFontSizes: [18, 12],
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                AutoSizeText(
                  '$description',
                  presetFontSizes: [18, 12],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                //local
                AutoSizeText(
                  '$local',
                  presetFontSizes: [12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                //budget
                AutoSizeText(
                  '$price',
                  presetFontSizes: [12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.blackColor,
                  ),
                ),
                AutoSizeText(
                  '$categorie',
                  presetFontSizes: [12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.secondary,
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
