import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/routes/routes.dart';

import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
