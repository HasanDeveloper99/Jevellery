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
        decoration: const BoxDecoration(
          gradient: kBGColor,
        ),
        child: Scaffold(
          backgroundColor: kTransparentColor,
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: kBlackColor,
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                    child: Text(
                      'CUSTOMERS',
                      style: TextStyle(
                        color:
                            _selectedIndex == 0 ? kBlackColor : Colors.black26,
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
                            _selectedIndex == 1 ? kBlackColor : Colors.black26,
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
