import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/error/netwerk_errors.dart';
import 'package:restaurant_app/core/widgets/customer_snack_bar_widget.dart';
import 'package:restaurant_app/routers/rounting_constant.dart';
import 'package:restaurant_app/routers/route_manager.dart';
import 'package:restaurant_app/services/auth_service.dart';

class AuthBloc extends ChangeNotifier {
  bool isloadingLoginButton = false;
  bool isloadingLogOutButton = false;
  bool isloadingRegisterButton = false;
  bool isloadingForgetPasswordButton = false;
  bool isobscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? user;
  Future<void> regiterAccoutFirebase(context) async {
    FocusScope.of(context).unfocus();
    isloadingRegisterButton = true;
    notifyListeners();

    try {
      await AuthService.registerAccount(
        emailAddress: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
      );
      clearController();
      RouteManager().routerManagerPushUntil(
        routeName: RountingConstants.loginScreen,
        context: context,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        final message = NetworkErrors.fromFirebase(e);
        CustomerSnackBar.show(context, message.networkError);
        log("************$message");
      }
      log("***=>Error:$e");
    }

    isloadingRegisterButton = false;
    notifyListeners();
  }

  Future<void> loginAccoutFirebase(context) async {
    FocusScope.of(context).unfocus();
    isloadingLoginButton = true;
    notifyListeners();
    try {
      await AuthService.loginAccount(
        emailAddress: emailController.text,
        password: passwordController.text,
      );
      gentUser();
      RouteManager().routerManagerPushUntil(
        routeName: RountingConstants.navBarScreen,
        context: context,
      );
      clearController();
    } catch (e) {
      if (e is FirebaseAuthException) {
        final message = NetworkErrors.fromFirebase(e);
        CustomerSnackBar.show(context, message.networkError);

        log("************${message.networkError}");
      }
      log("***=>Error:$e");
    }
    isloadingLoginButton = false;
    notifyListeners();
  }

  Future<void> forgetPasswordAccount(context) async {
    FocusScope.of(context).unfocus();
    isloadingForgetPasswordButton = true;
    notifyListeners();
    try {
      await AuthService.sendAccountForgetPassword(email: emailController.text);
      CustomerSnackBar.show(context, "Please , Check Your email");

      emailController.clear();
    } catch (e) {
      if (e is FirebaseAuthException) {
        final message = NetworkErrors.fromFirebase(e);
        CustomerSnackBar.show(context, message.networkError);
        log("************$message");
      }
      log("***=>Error:$e");
    }

    isloadingForgetPasswordButton = false;
    notifyListeners();
  }

  Future<void> logoutAccountFunction(context) async {
    FocusScope.of(context).unfocus();
    isloadingLogOutButton = true;
    notifyListeners();
    clearController();

    try {
      await AuthService.logoutAccount();
      await Future.delayed(const Duration(seconds: 2));
      RouteManager().routerManagerPushUntil(
        routeName: RountingConstants.loginScreen,
        context: context,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        final message = NetworkErrors.fromFirebase(e);
        CustomerSnackBar.show(context, message.networkError);
        log("************$message");
      }
      log("***=>Error:$e");
    }

    isloadingLogOutButton = false;
    notifyListeners();
  }

  void gentUser() {
    user = AuthService.getCurrentUSerAccount();
    notifyListeners();
  }

  String? validatorFunction(value, {bool isName = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    final nameRegExp =
        isName
            ? RegExp(r'^[a-zA-Z\s]+$')
            : RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return isName ? 'Name must contain only letters' : 'Enter correct Email';
    }
    return null;
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    nameController.clear();
    notifyListeners();
  }

  void obscureTextFunction() {
    isobscureText = !isobscureText;
    notifyListeners();
  }
}
