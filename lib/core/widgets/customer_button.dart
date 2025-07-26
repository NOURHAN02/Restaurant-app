import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_loading.dart';

class CustomerButton extends StatelessWidget {
  const CustomerButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(250, 55),
        backgroundColor: AppColor.kprimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: isLoading ? () {} : onPressed ?? () {},
      child:
          isLoading
              ? CustomerLoading()
              : Text(
                title,
                style: StyleApp.textStyle17.copyWith(color: Colors.white),
              ),
    );
  }
}
