import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/routes/app_router.dart';
import 'package:netflix_app/core/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // ! This is the initial route of the app (splash page)
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
