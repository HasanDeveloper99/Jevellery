import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Screens/Dummy%202/add_category_screen.dart';

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
      ),
      // initialRoute: AppRoutes.splash,
      // onGenerateRoute: AppRoutes.generateRoute,
      home: HomeScreen(),
    );
  }
}
