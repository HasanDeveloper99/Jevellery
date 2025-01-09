import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor.shade300,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhiteColor),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Shop Name",
          style: TextStyle(
            fontSize: 19,
            color: kWhiteColor,
            fontFamily: kFontFamily,
          ),
        ),
        backgroundColor: kAppBarColor,
        surfaceTintColor: kTransparentColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.notification_add,
              color: kWhiteColor,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            kSize15,
            OverViewData1(
              title: 'Customer Balance',
              green: '1,10,000',
              red: '1,10,000',
            ),
            kSize15,
            OverViewData1(
              title: 'Supplier Balance',
              green: '0',
              red: '1,10,000',
            ),
            kSize15,
            OverViewData2(
              title: 'Supplier GOLD Weight Balance',
              green: '1,10,000',
              red: '0.00',
            ),
            kSize15,
            OverViewData2(
              title: 'Supplier SILVER Weight Balance',
              green: '1,10,000',
              red: '0.00',
            ),
            kSize15,
          ],
        ),
      ),
    );
  }
}

// OverView 1 Data

class OverViewData1 extends StatelessWidget {
  final String title;
  final String green;
  final String red;
  const OverViewData1({
    super.key,
    required this.title,
    required this.green,
    required this.red,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kWhiteColor,
        ),
        child: Padding(
          padding: kPadding10,
          child: Column(
            children: [
              kSize10,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: kBlackColor,
                  fontFamily: kFontFamily,
                ),
              ),
              kSize5,
              Padding(
                padding: kPadding15,
                child: Divider(
                  color: kGreyColor.shade400,
                ),
              ),
              kSize5,
              Padding(
                padding: kPadding15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "₹ $green",
                            style: const TextStyle(
                              fontSize: 22,
                              color: kDarkGreenColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "( આપવાના )",
                            style: TextStyle(
                              fontSize: 22,
                              color: kDarkGreenColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "₹ $red",
                            style: const TextStyle(
                              fontSize: 22,
                              color: kRedColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "( લેવાના )",
                            style: TextStyle(
                              fontSize: 22,
                              color: kRedColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kSize10,
            ],
          ),
        ),
      ),
    );
  }
}

// OverView 2 Data
class OverViewData2 extends StatelessWidget {
  final String title;
  final String green;
  final String red;
  const OverViewData2({
    super.key,
    required this.title,
    required this.green,
    required this.red,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kWhiteColor,
        ),
        child: Padding(
          padding: kPadding10,
          child: Column(
            children: [
              kSize10,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: kBlackColor,
                  fontFamily: kFontFamily,
                ),
              ),
              kSize5,
              Padding(
                padding: kPadding15,
                child: Divider(
                  color: kGreyColor.shade400,
                ),
              ),
              kSize5,
              Padding(
                padding: kPadding15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "₹ $green",
                            style: const TextStyle(
                              fontSize: 22,
                              color: kDarkGreenColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "Gram",
                            style: TextStyle(
                              fontSize: 22,
                              color: kDarkGreenColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "( આપવાનું )",
                            style: TextStyle(
                              fontSize: 22,
                              color: kDarkGreenColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "₹ $red",
                            style: const TextStyle(
                              fontSize: 22,
                              color: kRedColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "( Gram )",
                            style: TextStyle(
                              fontSize: 22,
                              color: kRedColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "( લેવાનું )",
                            style: TextStyle(
                              fontSize: 22,
                              color: kRedColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: kFontFamily,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kSize10,
            ],
          ),
        ),
      ),
    );
  }
}
