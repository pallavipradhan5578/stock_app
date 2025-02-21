import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/helpers/theme/theme_notifier.dart';

class CommonThemeToggle extends ConsumerWidget {
  const CommonThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return IconButton(
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
        color: textColor,
      ),
      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
    );
  }
}
