import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/helpers/shared_pref.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1)); // Splash Delay
    String? token = await SharedPref.getToken();

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, "/home"); // ✅ If logged in, go to Home
    } else {
      Navigator.pushReplacementNamed(context, "/login"); // ❌ Otherwise, go to Login
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlutterLogo(size: 100), // Flutter icon in center
      ),
    );
  }
}
