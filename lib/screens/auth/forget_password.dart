import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';
import 'package:restaurant_app/core/widgets/customer_button.dart';
import 'package:restaurant_app/core/widgets/customer_snack_bar_widget.dart';
import 'package:restaurant_app/core/widgets/customer_text_form_filed.dart';
import 'package:restaurant_app/providers/auth_provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "RESTAURANT",
                  style: StyleApp.textStyle25,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                Text(
                  "Enter your email to reset your password and get back to tasty moments 🔑",
                  style: StyleApp.textStyle14.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: CustomerTextFormFiled(
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
                ),
                const SizedBox(height: 20.0),
                ForgetPasswordButton(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final authbloc = Provider.of<AuthBloc>(context);

    return SizedBox(
      width: double.infinity,
      child: CustomerButton(
        title: 'Send',
        isLoading: authbloc.isloadingForgetPasswordButton,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await authbloc.forgetPasswordAccount(context);
          } else {
            CustomerSnackBar.show(context, "Please enter all Field");
          }
        },
      ),
    );
  }
}
