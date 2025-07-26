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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              const SizedBox(height: 30),

              Text(
                "Create your account and start your delicious journey 🍕",
                style: StyleApp.textStyle14.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const TextFormRegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormRegisterScreen extends StatefulWidget {
  const TextFormRegisterScreen({super.key});

  @override
  State<TextFormRegisterScreen> createState() => _TextFormRegisterScreenState();
}

class _TextFormRegisterScreenState extends State<TextFormRegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomerTextFormFiled(
            controller: authbloc.nameController,
            hinitText: 'FullName',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(
              Icons.person,
              color: AppColor.kprimaryColor,
              size: 27,
            ),

            validator:
                (value) => authbloc.validatorFunction(value, isName: true),
          ),
          const SizedBox(height: 20.0),

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
            prefixIcon: const Icon(
              Icons.password,
              color: AppColor.kprimaryColor,
              size: 27,
            ),
          ),
          const SizedBox(height: 40.0),
          RegisterButtonWidgt(formKey: formKey),
          const SizedBox(height: 20.0),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                RouteManager().routerManagerPushUntil(
                  routeName: RountingConstants.loginScreen,
                  context: context,
                );
              },
              child: Text(
                "Login",
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

class RegisterButtonWidgt extends StatelessWidget {
  const RegisterButtonWidgt({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return SizedBox(
      width: double.infinity,
      child: CustomerButton(
        title: 'Regiter',
        isLoading: authbloc.isloadingRegisterButton,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await authbloc.regiterAccoutFirebase(context);
          } else {
            CustomerSnackBar.show(context, "Please enter all Field");
          }
        },
      ),
    );
  }
}
