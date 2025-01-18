import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Supplier/Details/supplier_entry_details.dart';

class CreditTab extends StatefulWidget {
  const CreditTab({super.key});

  @override
  State<CreditTab> createState() => _CreditTabState();
}

class _CreditTabState extends State<CreditTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          kSize15,
          const Row(
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
                "WEIGHT",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: kFontFamily,
                  color: kBlackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "AMOUNT",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: kFontFamily,
                  color: kBlackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            color: kBlackColor.withOpacity(0.5),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              // final data = detailsData[index];

              const style = TextStyle(
                color: kBlackColor,
                fontFamily: kFontFamily,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              );

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0, bottom: 9.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const SupplierEntryDetails());
                      },
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "15-01-2025",
                                  style: style,
                                ),
                                kSize3,
                                Text(
                                  "Complete Credit Entry",
                                  maxLines: 2,
                                  style: style,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "10 kg",
                                  style: style,
                                ),
                                kSize3,
                                Text(
                                  "( Silver )",
                                  style: TextStyle(
                                    color: kBlackColor,
                                    fontFamily: kFontFamily,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ 10,000.00",
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
    );
  }
}
