import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Dummy/due_customer_controller.dart';
import 'package:jewellery/Screens/Dummy/due_customer_form_screen.dart';

class DueCustomerScreen extends StatelessWidget {
  final DueCustomerFormController formController =
      Get.put(DueCustomerFormController());

  final style = const TextStyle(
    fontSize: 17,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  final customerNameStyle = const TextStyle(
    fontSize: 19,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  DueCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kYellowColor,
          onPressed: () {
            Get.to(DueCustomerFormScreen());
          },
          label: Text(
            "Add Due Customer",
            style: style,
          ),
        ),
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: [
                kSize10,
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: formController.formDataList.length,
                    itemBuilder: (context, index) {
                      final data = formController.formDataList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 7.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${data['customerName']}",
                                  maxLines: 1,
                                  style: customerNameStyle,
                                ),
                                Text(
                                  "Date: ${DateFormat('dd/MM/yyyy').format(data['date'])}",
                                  maxLines: 1,
                                  style: style,
                                ),
                                Text(
                                  "Amount: ${data['amount']}",
                                  maxLines: 1,
                                  style: style,
                                ),
                                Text(
                                  "Bill No.: ${data['billNo']}",
                                  maxLines: 1,
                                  style: style,
                                ),
                                Text(
                                  "Weight: ${data['weight']}",
                                  maxLines: 1,
                                  style: style,
                                ),
                                kSize5,
                                const Divider(),
                                kSize5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          formController.showDetails(data),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kGreyColor.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "View D.",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: kBlackColor,
                                                fontFamily: kFontFamily,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          formController.editData(index),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kGreenColor.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Edit D.",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: kBlackColor,
                                                fontFamily: kFontFamily,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          formController.deleteData(index),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kRedColor.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Delete D.",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: kBlackColor,
                                                fontFamily: kFontFamily,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () => formController.editData(index),
                                    //   child: const Icon(
                                    //     Icons.edit,
                                    //     size: 28,
                                    //     color: kGreenColor,
                                    //   ),
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () => formController.deleteData(index),
                                    //   child: const Icon(
                                    //     Icons.delete,
                                    //     size: 28,
                                    //     color: kRedColor,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                kSize3,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
