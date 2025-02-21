import 'package:flutter/material.dart';
import 'package:stoke/features/auth/view/login_page.dart';
import 'package:stoke/features/home/view/home_page.dart';
import 'package:stoke/features/splash/splash_page.dart';
import 'package:stoke/features/stocks/view/stock_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String stock = '/stock';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _pageRoute(const SplashPage());
      case login:
        return _pageRoute(const LoginPage());
      case home:
        return _pageRoute(const HomePage());
      case stock:
        final args = settings.arguments as int?;
        if (args == null) {
          return _errorRoute("Stock ID is required");
        }
        return _pageRoute(StockPage(stockId: args));
      default:
        return _errorRoute("Route Not Found");
    }
  }

  // Helper method for standard page navigation
  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  // Error route for invalid or missing arguments
  static MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text(message, style: const TextStyle(fontSize: 18))),
      ),
    );
  }
}
