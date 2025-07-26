import 'package:flutter/material.dart';

class RouteManager {
  // Navigator push Named
  routerManager({
    required String routeName,
    required BuildContext context,
    Object? arguments,
  }) => Navigator.of(context).pushNamed(routeName, arguments: arguments);

  // Navigator push and remove all screen
  routerManagerPushUntil({
    required String routeName,
    required BuildContext? context,
  }) {
    if (context != null) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(routeName, (route) => false);
    }
  }

  // navigator pop and push screen
  routerManagerPopAndPushNamed({
    required String routeName,
    required BuildContext? context,
  }) => Navigator.of(context!).popAndPushNamed(routeName);
}
