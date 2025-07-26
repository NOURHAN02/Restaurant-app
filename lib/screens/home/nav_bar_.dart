import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/screens/home/cart.dart';
import 'package:restaurant_app/screens/home/menu.dart';
import 'package:restaurant_app/screens/home/profile.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;
  List<Widget> page = [MenuView(), CardView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.kDarkItem.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 0,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: StyleApp.textStyle14,
          unselectedLabelStyle: StyleApp.textStyle13,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          unselectedIconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.6),
          ),
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'menu'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
