import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Screens/Bills/Screen/bills.dart';
import 'package:jewellery/Screens/Items/Screen/category.dart';
import 'package:jewellery/Screens/Overview/overview_screen.dart';
import 'package:jewellery/Screens/Parties/parties.dart';
import 'package:jewellery/Screens/Setting/Screen/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const OverViewScreen(),
    const PartiesScreen(),
    const BillsScreen(),
    const CategoryScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: kTransparentColor,
        // drawer: Drawer(
        //   // backgroundColor: kWhiteColor,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text(
        //           'Drawer Header',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.home),
        //         title: const Text('Home'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.settings),
        //         title: const Text('Settings'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.contact_page),
        //         title: const Text('Contact'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // appBar: AppBar(
        //   iconTheme: const IconThemeData(color: kWhiteColor),
        //   // automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: const Text(
        //     "Shop Name",
        //     style: TextStyle(
        //       fontSize: 19,
        //       color: kWhiteColor,
        //       fontFamily: kFontFamily,
        //     ),
        //   ),
        //   backgroundColor: kTransparentColor,
        //   surfaceTintColor: kTransparentColor,
        //   actions: const [
        //     Padding(
        //       padding: EdgeInsets.only(right: 15.0),
        //       child: Icon(
        //         Icons.notification_add,
        //         color: kWhiteColor,
        //       ),
        //     ),
        //   ],
        // ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: kAppBarColor,
          backgroundColor: kWhiteColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index
            });
          },
          type: BottomNavigationBarType.fixed, // To display 5 items
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2),
              label: 'Parties',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.line_style),
              label: 'Bills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
