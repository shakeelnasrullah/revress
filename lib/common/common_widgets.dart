
import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';

Widget requireTextLabel(String name) {
  return Row(
    children: [
      Text(name, style: TextStyle(color: AppColors.darkGray, fontSize: 14)),
      Text("*", style: TextStyle(color: AppColors.error)),
    ],
  );
}

Widget genericTextField(TextEditingController controller, String? hintText, Icon? icon, bool isDarkMode){
  return
    TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(

        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.lightGray),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
}

Widget buildDropdown({
  required String? value,
  required List<String> items,
  required String hint,
  required Function(String?) onChanged,
  required bool isDarkMode ,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: isDarkMode ? Colors.grey[500]! : Colors.black),
      borderRadius: BorderRadius.circular(4),
      color: isDarkMode ? Colors.grey[800]! : Colors.white,
      // color: Colors.white
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButton<String>(
        value: value,
        //hint: Text(hint),
        isExpanded: true,
        dropdownColor: isDarkMode ? AppColors.darkItemColor :Colors.white,
        style: TextStyle(color:  isDarkMode ? Colors.grey[400] :AppColors.darkItemColor,),
        underline: SizedBox(), // Remove default underline
        borderRadius: BorderRadius.circular(8),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

Widget dottedDivider({
  Color color = Colors.grey,
  double height = 1,
  double dashWidth = 4,
  double dashSpace = 4,
}) {
  return Row(
    children: List.generate(25, (index) =>
        Expanded(
          child: Container(
            height: height,
            margin: EdgeInsets.symmetric(horizontal: dashSpace / 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
        ),
    ),
  );
}