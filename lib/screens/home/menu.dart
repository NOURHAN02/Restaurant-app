import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_menu_item_widget.dart';
import 'package:restaurant_app/providers/auth_provider.dart';
import 'package:restaurant_app/providers/menu_provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          TiltleMenuWidget(),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          ListMeunItems(),
        ],
      ),
    );
  }
}

class TiltleMenuWidget extends StatelessWidget {
  const TiltleMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            Text(
              "Hi, ${authbloc.user?.displayName}",
              style: StyleApp.textStyle17,
            ),
            const Text("Choose Dishes", style: StyleApp.textStyle25),
          ],
        ),
      ),
    );
  }
}

class ListMeunItems extends StatelessWidget {
  const ListMeunItems({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = Provider.of<MenuProvider>(context);
    return SliverPadding(
      padding: const EdgeInsets.all(10.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) =>
              CustomerMenuItemWidget(foodModel: menuBloc.europeanFoods[index]),
          childCount: menuBloc.europeanFoods.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 0.0,
          mainAxisExtent: 200,
        ),
      ),
    );
  }
}
