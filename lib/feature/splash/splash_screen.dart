import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mcr/core/helpers/extensions.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/app_colors.dart';
import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
           context.pushReplacementNamed(Routes.homeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          Assets.imagesLogo,
        ),
      ),
    );
  }
}
