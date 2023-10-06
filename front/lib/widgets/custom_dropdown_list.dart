import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';

class CustomDropdownList extends StatefulWidget {
  const CustomDropdownList({Key? key}) : super(key: key);

  @override
  State<CustomDropdownList> createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  final List<String> items = [
    'Tunis', 'Ariana', 'Mannouba'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Location',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              AccountInfoStorage.saveProductLocal(value);
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.redAccent,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.redAccent,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      
    );
  }
}



  /* String local = "Tunis";
  var items = ['Tunis', 'Ariana', 'Mannouba'];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Localion",
          style: TextStyle(color: Colors.black54, fontSize: 18),
        ),
        DropdownButton(
          // Initial Value
          value: local,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(
                "$items",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              local = newValue!;
            });
          },
        ),
      ],
    );
    // DropdownButton(
    //   value: local,
    //   style: TextStyle(fontSize: 16, color: AppColor.goldColor),
    //   dropdownColor: Colors.white,
    //   underline: Container(
    //     height: 1,
    //     width: 400,
    //     color: AppColor.goldColor,
    //   ),
    //   iconEnabledColor: AppColor.goldColor,
    //   items: items.map((String value1) {
    //     return DropdownMenuItem<String>(
    //       value: value1,
    //       child: Text(
    //         value1,
    //         style: TextStyle(color: Colors.black54),
    //       ),
    //     );
    //   }).toList(),
    //   onChanged: (value) {
    //     //  value = value;
    //     AccountInfoStorage.saveProductLocal(value);
    //     setState(() {
    //       local = value!;
    //     });
    //     print(value);
    //   },
    // ),

    //   ],
    // );
  }
}
 */