import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';

class CustomerItemProfileContainer extends StatelessWidget {
  const CustomerItemProfileContainer({super.key, required this.cilentName});
  final String cilentName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColor.kDarkItem.withOpacity(0.4),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(cilentName, style: StyleApp.textStyle17),
    );
  }
}
