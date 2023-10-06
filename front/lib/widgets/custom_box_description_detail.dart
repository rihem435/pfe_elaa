import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class CustomBoxDescriptionDetail extends GetView<ProductsController> {
  const CustomBoxDescriptionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          text: "data",
        ),
        Text(
          "${AccountInfoStorage.readProductDescription().toString()}",
          /*  "https://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharinghttps://drive.google.com/drive/folders/1aKiCxWn8FIf231q6if4z-ZpwcqnfU-NZ?usp=sharing",
                     */
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ],
    );
  }
}
