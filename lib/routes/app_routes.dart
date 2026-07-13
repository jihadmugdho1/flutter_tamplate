import 'package:get/get.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter_tamplate/features/authentication/bindings/auth_binding.dart';
import 'package:flutter_tamplate/features/splash/bindings/splash_binding.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentation/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/splash/presentation/ui/splash_screen.dart';

class AppRoute {
  static const String loginScreen = "/loginScreen";
  static const String splashScreen = "/splashScreen";
  static const String bottomNavScreen = "/bottomNavScreen";


  static const String internetlost = "/internetlost";
  static const String communityScreen = "/communityScreen";

  static String getLoginScreen() => loginScreen;
  static String getSplashScreen() => splashScreen;
  static String getBottomNavScreen() => bottomNavScreen;
 
  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen(), binding: AuthBinding()),
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: bottomNavScreen, page: () => const BottomNavScreen()),

    
  ];
}
