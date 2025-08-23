
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

Widget genericTextField(TextEditingController controller, String hintText, Icon icon){
  return
    TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
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