import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/button.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Bills/Sales/Data/sales_data.dart';
import 'package:jewellery/Screens/Parties/Customer/Form/customer_form.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final style = const TextStyle(
    fontFamily: kFontFamily,
    fontSize: 19,
    color: kBlackColor,
    fontWeight: FontWeight.w500,
  );
  final style1 = const TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16,
    color: kBlackColor,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade300,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        body: Column(
          children: [
            kSize15,
            Padding(
              padding: kPadding15,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: kPadding15,
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.search,
                        color: kBlackColor,
                        size: 23,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search sales",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            kSize9,
            Padding(
              padding: EdgeInsets.only(
                right: 15,
                left: 15,
                bottom: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kSize3,
                  Text(
                    "Today",
                    style: style,
                  ),
                  kSize3,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: salesDataList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 3,
                          ),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                color: kButtonColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.currency_rupee_sharp,
                                  size: 25,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                            title: Text(
                              salesDataList[index].customerName,
                              style: style,
                            ),
                            subtitle: Text(
                              salesDataList[index].date,
                              style: style1,
                            ),
                            trailing: Text(
                              "₹ ${salesDataList[index].amount}",
                              style: style,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  kSize20,
                  CommanButton(
                    buttonText: "Load More",
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(CustomerFormScreen());
          },
          icon: const Icon(
            Icons.add,
            color: kWhiteColor,
            size: 28,
          ),
          label: const Text(
            'Add Sales',
            style: TextStyle(
              fontSize: 18,
              fontFamily: kFontFamily,
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kGreenColor,
        ),
      ),
    );
  }
}
