import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/padding_and_size.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade200,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kWhiteColor),
          title: const Text(
            "Setting",
          ),
          backgroundColor: kWhiteColor,
          surfaceTintColor: kTransparentColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  // Get.to(const NotificationScreen());
                },
                child: const Icon(
                  Icons.edit,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            kSize30,
            // Image Picker
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kGreyColor,
                      border: Border.all(
                        color: kRedColor,
                        width: 2,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: -5,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kButtonColor,
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.camera,
                          size: 13,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
