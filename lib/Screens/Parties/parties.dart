import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Screens/Parties/Tabs/customers.dart';
import 'package:jewellery/Screens/Parties/Tabs/suppliers.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({super.key});

  @override
  State<PartiesScreen> createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen>
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
        decoration: BoxDecoration(
          color: kWhiteColor,
        ),
        child: Scaffold(
          backgroundColor: kTransparentColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: kWhiteColor),
            leading: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
              color: kBlackColor,
            ),
            centerTitle: true,
            title: const Text(
              "Parties",
              style: TextStyle(
                fontSize: 19,
                color: kBlackColor,
                fontFamily: kFontFamily,
              ),
            ),
            backgroundColor: kWhiteColor,
            surfaceTintColor: kTransparentColor,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.notification_add,
                  color: kBlackColor,
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
                      'CUSTOMERS',
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
                      'SUPPLIERS',
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
                    CustomerScreen(),
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
