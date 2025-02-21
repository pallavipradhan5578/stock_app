import 'package:flutter/material.dart';
import 'package:stoke/common_widgets/logout_popup.dart';
import 'package:stoke/core/utills/constants/color_constants.dart';
import 'package:stoke/core/utills/helpers/shared_pref.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    await SharedPref.removeToken(); // Clear saved token
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.logout, color: ColorConstants.errorColor),
        onPressed: () {
          showLogoutDialog(context, () {
            _logout(context);
          });
        });
  }
}
