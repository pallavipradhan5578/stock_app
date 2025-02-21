import 'package:flutter/material.dart';
import 'package:stoke/common_widgets/common_button.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';

Future<void> showLogoutDialog(
    BuildContext context, VoidCallback onConfirm) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(StringConstants.logout),
      content: const Text(StringConstants.logoutConfirm),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Close dialog
          child: const Text(StringConstants.logoutCancel),
        ),
        CommonButton(
          height: 40,
          width: 130,
          text: StringConstants.logout,
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    ),
  );
}
