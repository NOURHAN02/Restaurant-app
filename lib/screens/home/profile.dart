import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_button.dart';
import 'package:restaurant_app/core/widgets/customer_item_profile_container.dart';
import 'package:restaurant_app/providers/auth_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(7.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          ImageProfileWidget(),
          InfoProfileWidget(),
          ButtonProfileWidget(),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }
}

class ButtonProfileWidget extends StatelessWidget {
  const ButtonProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: CustomerButton(
          title: "Logout",
          onPressed: () async {
            await authbloc.logoutAccountFunction(context);
          },
          isLoading: authbloc.isloadingLogOutButton,
        ),
      ),
    );
  }
}

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomerItemInProfile(
            title: 'Name',
            cilentName: authbloc.user?.displayName ?? "",
          ),
          CustomerItemInProfile(
            title: 'Email',
            cilentName: authbloc.user?.email ?? "",
          ),
        ],
      ),
    );
  }
}

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CircleAvatar(
        radius: 120,
        backgroundColor: AppColor.kDarkItem.withOpacity(0.5),
        child: const Icon(Icons.person, size: 200),
      ),
    );
  }
}

class CustomerItemInProfile extends StatelessWidget {
  const CustomerItemInProfile({
    super.key,
    required this.title,
    required this.cilentName,
  });
  final String title;
  final String cilentName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: StyleApp.textStyle18),
          CustomerItemProfileContainer(cilentName: cilentName),
        ],
      ),
    );
  }
}
