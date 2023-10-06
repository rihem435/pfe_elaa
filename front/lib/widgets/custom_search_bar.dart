import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_input_text.dart';

class CustomSearchBar extends StatelessWidget {
  final Function? function;
  const CustomSearchBar({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputText(
          label: 'Search',
          iconData: Icons.search,
          obscureText: false,
          function: function,
        )
      ],
    );
  }
}
