import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Screens/Parties/Supplier/Details/Tab/credit_tab.dart';
import 'package:jewellery/Screens/Parties/Supplier/Details/Tab/debit_tab.dart';
import 'package:jewellery/Screens/Parties/Supplier/Form/supplier_credit_form.dart';
import 'package:jewellery/Screens/Parties/Supplier/Form/supplier_debit_form.dart';

class SupplierDetails extends StatefulWidget {
  const SupplierDetails({super.key});

  @override
  State<SupplierDetails> createState() => _SupplierDetailsState();
}

class _SupplierDetailsState extends State<SupplierDetails>
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
            backgroundColor: kWhiteColor,
            centerTitle: true,
            title: const Text(
              "Hasan",
              style: TextStyle(
                fontSize: 19,
                color: kBlackColor,
                fontFamily: kFontFamily,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.edit,
                  color: kBlackColor,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: kWhiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SupplierCreditForm());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Credit",
                          style: TextStyle(
                            fontSize: 18,
                            color: kWhiteColor,
                            fontFamily: kFontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SupplierDebitForm());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kRedColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Debit",
                          style: TextStyle(
                            fontSize: 18,
                            color: kWhiteColor,
                            fontFamily: kFontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                      'CREDIT',
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
                      'DEBIT',
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
                    CreditTab(),
                    DebitTab(),
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
