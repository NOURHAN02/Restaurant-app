import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';

class CustomerDetailsButton extends StatelessWidget {
  const CustomerDetailsButton({
    super.key,
    this.onPressed,
    required this.titleButton,
    this.isLeft = false,
  });
  final void Function()? onPressed;
  final String titleButton;

  final bool isLeft;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isLeft ? Colors.white : AppColor.kprimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isLeft ? Colors.white : AppColor.kprimaryColor,
          ),
          borderRadius:
              isLeft
                  ? const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  )
                  : const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        titleButton,
        style: StyleApp.textStyle14.copyWith(
          color: isLeft ? AppColor.kprimaryColor : Colors.white,
        ),
      ),
    );
  }
}
