import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/core/configs/routes/routes.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          AppImages.largeLogo
        ),
      ),
    );
  }

  // ! This method is used to redirect to the home page after 2 seconds
  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Routes.home);
  }
}
