import 'package:flutter/material.dart';
import 'package:front/widgets/custom_dropdown_list.dart';

class TestView extends StatelessWidget {
const TestView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child:
      CustomDropdownList()
    );
  }
}