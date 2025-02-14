import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Screens/Bills/Sales/Screen/sales_screen.dart';
import 'package:jewellery/Screens/Notification/notification_screen.dart';
import 'package:jewellery/Screens/Parties/Supplier/Screen/suppliers.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: kWhiteColor,
        ),
        child: Scaffold(
          backgroundColor: kTransparentColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: kWhiteColor),
            title: const Text(
              "Bills",
            ),
            backgroundColor: kWhiteColor,
            surfaceTintColor: kTransparentColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const NotificationScreen());
                  },
                  child: const Icon(
                    Icons.notification_add,
                    color: kBlackColor,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: kAppBarColor,
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                    child: Text(
                      'SALES',
                      style: TextStyle(
                        color:
                            _selectedIndex == 0 ? kAppBarColor : Colors.black26,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: kFontFamily,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'EXPENSE',
                      style: TextStyle(
                        color:
                            _selectedIndex == 1 ? kAppBarColor : Colors.black26,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: kFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    SalesScreen(),
                    SuppliersScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
