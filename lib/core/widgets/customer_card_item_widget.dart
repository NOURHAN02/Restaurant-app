import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/providers/menu_provider.dart';

class CustomerCardItem extends StatelessWidget {
  const CustomerCardItem({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColor.kDarkItem,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                foodModel.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodModel.name,
                    style: StyleApp.textStyle17,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${foodModel.price}"
                    r"$",
                    style: StyleApp.textStyle17,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),

            InkWell(
              onTap: () {
                menuBloc.removeFromCart(context: context, foodModel: foodModel);
              },
              child: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
