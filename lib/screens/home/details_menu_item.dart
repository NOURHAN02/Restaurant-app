import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_details_button.dart';
import 'package:restaurant_app/core/widgets/customer_image_widget.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/providers/menu_provider.dart';

class DetailsMenuItem extends StatelessWidget {
  const DetailsMenuItem({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CustomerImage(image: foodModel.imageUrl),
              ),
              const SizedBox(height: 20),
              Text(
                foodModel.name,
                style: StyleApp.textStyle20,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Row(
                spacing: 5,
                children: [
                  Text(
                    "Price : ",
                    style: StyleApp.textStyle17.copyWith(
                      color: AppColor.kprimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${foodModel.price}"
                    r"$",
                    style: StyleApp.textStyle18,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 6),

              Text(
                "Descripction ",
                style: StyleApp.textStyle17.copyWith(
                  color: AppColor.kprimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 7),
              Text(foodModel.description, style: StyleApp.textStyle13),
              const SizedBox(height: 6),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: foodModel.country,
                      style: StyleApp.textStyle13,
                    ),
                    const TextSpan(text: "  "),

                    TextSpan(
                      text: foodModel.halal == true ? "halal" : "not halal",
                      style: StyleApp.textStyle13.copyWith(
                        color: AppColor.kprimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                foodModel.ingredients.join(" , "),
                style: StyleApp.textStyle13,
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomerDetailsButton(
                        titleButton: "${foodModel.amountAvailable} Available",
                        isLeft: true,
                      ),
                    ),
                    Expanded(
                      child: CustomerDetailsButton(
                        titleButton: "Add To Card",
                        onPressed: () {
                          menuBloc.addToCard(
                            foodModel: foodModel,
                            context: context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
