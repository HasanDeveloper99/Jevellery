import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Screens/Main_Screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jewellery Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'SFProRegular',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 19,
            color: kBlackColor,
            fontFamily: kFontFamily,
          ),
          surfaceTintColor: kTransparentColor,
        ),
      ),
      // initialRoute: AppRoutes.splash,
      // onGenerateRoute: AppRoutes.generateRoute,
      home: const MainScreen(),
    );
  }
}
