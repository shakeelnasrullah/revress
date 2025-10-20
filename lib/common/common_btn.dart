import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';


Widget rectangleThemeBtn( String title,  Function onClick) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      onPressed: onClick(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    ),
  );
}

Widget buildRoundedButton({
  required String text,
  required Color backgroundColor,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}

