import 'dart:async';

import 'package:get/get.dart';
import 'package:riddimafrica/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 1000000000000000), () {
      Get.offAllNamed(AppRoute.getBottomNavScreen());
    });
  }
}
