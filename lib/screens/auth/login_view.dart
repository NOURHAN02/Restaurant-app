import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_button.dart';
import 'package:restaurant_app/core/widgets/customer_snack_bar_widget.dart';
import 'package:restaurant_app/core/widgets/customer_text_form_filed.dart';
import 'package:restaurant_app/providers/auth_provider.dart';
import 'package:restaurant_app/routers/rounting_constant.dart';
import 'package:restaurant_app/routers/route_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "RESTAURANT",
                style: StyleApp.textStyle25,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                "Welcome back! Please login to continue 🍽️",
                style: StyleApp.textStyle14.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const TextFormLoginSceen(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormLoginSceen extends StatefulWidget {
  const TextFormLoginSceen({super.key});

  @override
  State<TextFormLoginSceen> createState() => _TextFormLoginSceenState();
}

class _TextFormLoginSceenState extends State<TextFormLoginSceen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomerTextFormFiled(
            controller: authbloc.emailController,
            hinitText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(
              Icons.email,
              color: AppColor.kprimaryColor,
              size: 27,
            ),
            validator: (value) => authbloc.validatorFunction(value),
          ),
          const SizedBox(height: 20.0),
          CustomerTextFormFiled(
            controller: authbloc.passwordController,
            hinitText: 'Password',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: authbloc.isobscureText,
            prefixIcon: const Icon(
              Icons.password,
              color: AppColor.kprimaryColor,
              size: 27,
            ),
            suffixIcon: InkWell(
              onTap: () {
                authbloc.obscureTextFunction();
              },
              child: Icon(
                authbloc.isobscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColor.kprimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                RouteManager().routerManager(
                  routeName: RountingConstants.forgetPasswordScreen,
                  context: context,
                );
              },
              child: const Text(
                "Forget Password ?",
                style: StyleApp.textStyle14,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          LoginButtonWidgt(formKey: formKey),
          const SizedBox(height: 20.0),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                RouteManager().routerManagerPushUntil(
                  routeName: RountingConstants.registerScreen,
                  context: context,
                );
              },
              child: Text(
                "Register",
                style: StyleApp.textStyle17.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColor.kprimaryColor,
                  decorationColor: AppColor.kprimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButtonWidgt extends StatelessWidget {
  const LoginButtonWidgt({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return SizedBox(
      width: double.infinity,
      child: CustomerButton(
        title: 'Login',
        isLoading: authbloc.isloadingLoginButton,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            authbloc.loginAccoutFirebase(context);
          } else {
            CustomerSnackBar.show(context, "Please enter all Field");
          }
        },
      ),
    );
  }
}
