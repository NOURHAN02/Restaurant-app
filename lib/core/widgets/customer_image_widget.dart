import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/widgets/customer_loading.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
        color: AppColor.kDarkBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        errorWidget:
            (context, url, error) =>
                const Icon(Icons.error_outline, color: AppColor.kprimaryColor),
        placeholder: (context, url) => const CustomerLoading(),
      ),
    );
  }
}
