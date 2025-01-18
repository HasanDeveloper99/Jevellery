import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notification"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isNotificationOn = !_isNotificationOn;
                });
              },
              child: Icon(
                _isNotificationOn
                    ? Icons.notifications
                    : Icons.notifications_off,
                color: kBlackColor,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "No any notification found!",
          style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: 20,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
