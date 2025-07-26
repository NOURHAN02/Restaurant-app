import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_image_widget.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/routers/rounting_constant.dart';
import 'package:restaurant_app/routers/route_manager.dart';

class CustomerMenuItemWidget extends StatelessWidget {
  const CustomerMenuItemWidget({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteManager().routerManager(
          routeName: RountingConstants.detailsItemMenuScreen,
          context: context,
          arguments: foodModel,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 40.0,
              right: 30.0,
              left: 30.0,
              bottom: 20.0,
            ),
            decoration: BoxDecoration(
              color: AppColor.kDarkItem,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Text(
                  foodModel.name,
                  style: StyleApp.textStyle14,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  r"$"
                  "${foodModel.price}",
                  style: StyleApp.textStyle13,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  "${foodModel.amountAvailable} meal available",
                  style: StyleApp.textStyle13,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Center(child: CustomerImage(image: foodModel.imageUrl)),
          ),
        ],
      ),
    );
  }
}
