import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/Screens/Main_Screen/main_screen.dart';
import 'package:jewellery/Screens/On_Boarding_Screen/splash_screen.dart';
import 'package:jewellery/Screens/Regester_Screens/forgot_pass_screen.dart';
import 'package:jewellery/Screens/Regester_Screens/new_pass_screen.dart';
import 'package:jewellery/Screens/Regester_Screens/otp_screen.dart';
import 'package:jewellery/Screens/Regester_Screens/sign_in_screen.dart';
import 'package:jewellery/Screens/Regester_Screens/sign_up_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signin = '/signin';
  static const String signUp = '/signUp';
  static const String forgotPass = '/forgotPass';
  static const String otpScreen = '/otpScreen';
  static const String changePassScreen = '/changePassScreen';
  static const String homeScreen = '/homeScreen';
  static const String mainScreen = '/mainScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case splash:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());

      // SignUp Screen
      case AppRoutes.signUp:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());

      // SignIn Screen
      case AppRoutes.signin:
        return CupertinoPageRoute(builder: (_) => const SignInScreen());

      // Forgot Password Screen
      case AppRoutes.forgotPass:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordScreen());

      // OTP Screen
      case AppRoutes.otpScreen:
        return CupertinoPageRoute(builder: (_) => const OTPScreen());

      // Change Password Screen
      case AppRoutes.changePassScreen:
        return CupertinoPageRoute(builder: (_) => const ChangeNewPassword());

      // Home Screen
      // case AppRoutes.homeScreen:
      //   return CupertinoPageRoute(builder: (_) => const MainScreen());

      // Main Screen
      case AppRoutes.mainScreen:
        return CupertinoPageRoute(builder: (_) => const MainScreen());

      // Default
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
