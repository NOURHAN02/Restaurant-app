import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';

class CustomerSnackBar {
  static void show(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: StyleApp.textStyle14.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColor.kprimaryColor,
      ),
    );
  }
}
