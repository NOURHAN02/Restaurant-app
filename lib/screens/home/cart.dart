import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_button.dart';
import 'package:restaurant_app/core/widgets/customer_card_item_widget.dart';
import 'package:restaurant_app/providers/menu_provider.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);

    return SafeArea(
      child:
          menuBloc.cardList.isEmpty
              ? const EmptyCartWidget()
              : const CartWdiget(),
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_sharp,
                  color: AppColor.kprimaryColor,
                  size: 120,
                ),
                Text(
                  "Your cart is currently empty.",
                  style: StyleApp.textStyle18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CartWdiget extends StatelessWidget {
  const CartWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);

    return CustomScrollView(
      slivers: [
        const TiltleCardWidget(),
        const ListCardItem(),
        const TotalPriceCardWidget(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: CustomerButton(
              title: "CheckOut",
              isLoading: menuBloc.isCheckOut,
              onPressed: () async {
                await menuBloc.checkOutFunction(context: context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TotalPriceCardWidget extends StatelessWidget {
  const TotalPriceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Total Price", style: StyleApp.textStyle25),
            Row(
              spacing: 6.0,
              children: [
                Text(
                  "Total Price : ",
                  style: StyleApp.textStyle18.copyWith(
                    color: AppColor.kprimaryColor,
                  ),
                ),

                Text(
                  "${menuBloc.totalPrice()}"
                  r"$",
                  style: StyleApp.textStyle18,
                ),
              ],
            ),
            Row(
              spacing: 6.0,
              children: [
                Text(
                  "Discount : ",
                  style: StyleApp.textStyle18.copyWith(
                    color: AppColor.kprimaryColor,
                  ),
                ),

                const Text(r"0$", style: StyleApp.textStyle18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListCardItem extends StatelessWidget {
  const ListCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            CustomerCardItem(foodModel: menuBloc.cardList[index]),
        childCount: menuBloc.cardList.length,
      ),
    );
  }
}

class TiltleCardWidget extends StatelessWidget {
  const TiltleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text("Orders", style: StyleApp.textStyle30),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
