import 'package:flutter/material.dart';
import 'package:riddimafrica/core/controllers/theme_controller.dart';
import 'package:riddimafrica/core/core.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bordercolor,
          image: const DecorationImage(
            image: AssetImage("assets/images/backgrund.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
