import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/common_widgets/common_button.dart';
import 'package:stoke/common_widgets/common_theme_toggle.dart';
import 'package:stoke/core/utills/constants/size_constants.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/usecases.dart';
import 'package:stoke/features/auth/view_model/login_notifier.dart';
import '../../../common_widgets/common_text_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider);
    final formKey = GlobalKey<FormState>();

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subTextColor = isDarkMode ? Colors.white70 : Colors.black45;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.pagePadding),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: CommonThemeToggle(),
                ),
                Text(
                  StringConstants.welcomeBackTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: textColor),
                ),
                Text(
                  StringConstants.welcomeBackSubTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: subTextColor,
                  ),
                ),
                const SizedBox(height: SizeConstants.largePadding),
                Text(
                  StringConstants.email,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: textColor),
                ),
                const SizedBox(height: SizeConstants.textFieldTitlePadding),
                CommonTextField(
                  controller: loginNotifier.emailController,
                  hintText: StringConstants.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  validator: UseCases.validateEmail,
                ),
                const SizedBox(height: SizeConstants.textFieldPadding),
                Text(
                  StringConstants.password,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: textColor),
                ),
                const SizedBox(height: SizeConstants.textFieldTitlePadding),
                CommonTextField(
                  controller: loginNotifier.passwordController,
                  hintText: StringConstants.passwordHint,
                  isPassword: true,
                  validator: UseCases.validatePassword,
                ),
                const SizedBox(height: SizeConstants.textFieldPadding),
                if (!loginNotifier.isLoading)
                  CommonButton(
                    text: StringConstants.login,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginNotifier.login(context);
                      }
                    },
                  ),
                if (loginNotifier.isLoading)
                  const Center(child: CircularProgressIndicator()),
                const Padding(
                  padding: EdgeInsets.only(top: SizeConstants.mediumPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email-ID: test@gmail.com"),
                      SizedBox(height: SizeConstants.smallPadding),
                      Text("Password: Test@1234")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
