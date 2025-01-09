import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Customer/Data/customer_details_data.dart';
import 'package:jewellery/Screens/Parties/Customer/Form/customer_credit_form.dart';
import 'package:jewellery/Screens/Parties/Customer/Form/customer_debit_form.dart';
import 'package:jewellery/Screens/Parties/Customer/Details/customer_entry_details.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade300,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Hasan Abbas",
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.edit),
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
                    Get.to(const CustomerDebitForm());
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
              const SizedBox(width: 15),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const CustomerCreditForm());
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              kSize15,

              // Total Balance Container
              Padding(
                padding: kPadding15,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            fontSize: 22,
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: kFontFamily,
                          ),
                        ),
                        kSize3,
                        Row(
                          children: [
                            Text(
                              "₹ 10,000.00",
                              style: TextStyle(
                                fontSize: 20,
                                color: kGreenColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: kFontFamily,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "( આપવાના )",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: kFontFamily,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              kSize15,

              // Credit & Debit Entries

              Container(
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ENTRIES",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: kFontFamily,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "DEBIT",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: kFontFamily,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "CREDIT",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: kFontFamily,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: kBlackColor.withOpacity(0.5),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: customerDetailsData.length,
                        itemBuilder: (context, index) {
                          // data
                          final data = customerDetailsData[index];

                          const style = TextStyle(
                            color: kBlackColor,
                            fontFamily: kFontFamily,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          );

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 9.0, bottom: 9.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(const CustomerEntryDetails());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.date,
                                              style: style,
                                            ),
                                            kSize3,
                                            Text(
                                              data.description,
                                              maxLines: 2,
                                              style: style,
                                            ),
                                            kSize3,
                                            Text(
                                              "Bill No: ${data.billNo.toString()}",
                                              style: style,
                                            ),
                                            kSize3,
                                            Text(
                                              "Weight ${data.weight.toString()}",
                                              style: style,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              data.debit.toString(),
                                              style: style,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "₹ ${data.credit.toString()}",
                                              style: TextStyle(
                                                color: kDarkGreenColor,
                                                fontFamily: kFontFamily,
                                                fontSize: 15,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              kSize20,
            ],
          ),
        ),
      ),
    );
  }
}
