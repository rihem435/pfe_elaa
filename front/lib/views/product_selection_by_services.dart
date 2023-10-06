import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:front/widgets/custom_search_bar.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductSelectionByServices extends GetView<ProductsController> {
  const ProductSelectionByServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller.getCategorieById(controller.categorieGetByIdJson!.data!.sId.toString());
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
            )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Services',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: [
            //search bar
            Expanded(flex: 1, child: CustomSearchBar()),

            Expanded(
              flex: 6,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      child: CustomFavoriteList(
                        function: () {},
                        img: 'assets/images/logo2.png',
                        Descriptiontext:
                            "lorem ion was thrown: Incorrect use of ParentDataWidgetAnother exception was thrown: Incorrect use of ParentDataWidgetAnother exception was thrown: Incorrect use of ParentDataWidget",
                        ServiceName: "Catering ",
                        height: 200,
                        width: 200,
                        colorBorder: AppColor.goldColor,
                        widthBorder: 1,
                      ),
                      onTap: () {
                        Get.to(ProductDetail());
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
