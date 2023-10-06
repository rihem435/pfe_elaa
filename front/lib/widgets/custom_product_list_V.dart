import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/views/vendors/test_View.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class CustomProductListV extends GetView<EventController> {
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
    ScrollController scrollController = ScrollController();

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
                  'Product $productName',
                  overflow: TextOverflow.ellipsis,
                  presetFontSizes: [18, 12],
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                AutoSizeText(
                  'Description $description',
                  presetFontSizes: [18, 12],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                //local
                AutoSizeText(
                  'Local $local',
                  presetFontSizes: [ 12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                //budget
                AutoSizeText(
                  'Price $price',
                  presetFontSizes: [12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.blackColor,
                  ),
                ),
                AutoSizeText(
                  'Categorie $categorie',
                  presetFontSizes: [ 12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.secondary,
                  ),
                ),
                //     CustomText(text: "Pack of services:"),
                // services data which are related to each event
                /*     TextButton(
                  onPressed: () {
                   // Get.to(TestView());
                  },
                  child: FlutterImageStack(
                    showTotalCount: true,
                    ////// get services data /////////
                    imageList: _images,
                    totalCount: _images.length,
                    itemRadius: 40,
                    itemCount: 5,
                    itemBorderWidth: 1,
                    itemBorderColor: AppColor.secondary,
                    backgroundColor: AppColor.secondary,
                  ),
                ),
             */
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/* 
List<String> _images = [
  'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
      'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
]; */
