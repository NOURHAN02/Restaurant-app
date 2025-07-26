import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/routers/rounting_constant.dart';
import 'package:restaurant_app/screens/auth/forget_password.dart';
import 'package:restaurant_app/screens/auth/login_view.dart';
import 'package:restaurant_app/screens/auth/register_view.dart';
import 'package:restaurant_app/screens/home/details_menu_item.dart';
import 'package:restaurant_app/screens/home/nav_bar_.dart';
import 'package:restaurant_app/screens/splash/splash_view.dart';

class Routers {
  static Route<dynamic> generteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RountingConstants.splashScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SplashView();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );

      case RountingConstants.loginScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LoginView();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );

      case RountingConstants.registerScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const RegisterView();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );

      case RountingConstants.forgetPasswordScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ForgetPassword();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );
      case RountingConstants.navBarScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const NavBarWidget();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );
      case RountingConstants.detailsItemMenuScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final item = settings.arguments as FoodModel;
            return DetailsMenuItem(foodModel: item);
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
        );
    }
  }
}
