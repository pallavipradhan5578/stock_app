import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/constants/color_constants.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/shared_pref.dart';
import 'package:stoke/core/utills/helpers/usecases.dart';
import 'package:stoke/features/auth/repository/login_repository.dart';

class LoginNotifier extends ChangeNotifier {
  final UseCases authUseCase;
  LoginNotifier(this.authUseCase);
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringConstants.combineValidationMsg)),
      );
      return;
    } else {
      isLoading = true;
      notifyListeners();

      final response = await authUseCase.executeLogin(email, password);

      isLoading = false;
      notifyListeners();

      if (response?.jwt != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(StringConstants.loginSuccess),
            backgroundColor:  ColorConstants.successColor,
          ),
        );

        // Save token
        String token = response?.jwt ?? "";
        await SharedPref.saveToken(token);
        emailController.clear();
        passwordController.clear();
        // Navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response?.error?.message ?? ''),
            backgroundColor:  ColorConstants.errorColor,
          ),
        );
      }
    }
  }
}

final loginProvider = ChangeNotifierProvider<LoginNotifier>((ref) {
  return LoginNotifier(UseCases(repository: LoginRepository()));
});
