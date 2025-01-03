import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Ledger/ledger_controller.dart';
import 'package:jewellery/Ledger/ledger_form.dart';

class LadgerScreen extends StatelessWidget {
  final formController = Get.put(LadgerController());

  LadgerScreen({super.key});

  final style = const TextStyle(
    fontSize: 16,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  final style1 = const TextStyle(
    fontSize: 18,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  final actionStyle = const TextStyle(
    fontSize: 13,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(title: const Text('Home')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            formController.editingIndex =
                null; // Ensure no item is being edited
            Get.to(() =>
                LadgerFormScreen()); // Navigate to FormScreen for adding new data
          },
          backgroundColor: kGreenColor,
          label: const Text(
            "Add Ladger",
            style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: 18,
              color: kWhiteColor,
            ),
          ),
        ),
        body: Obx(
          () => formController.dataList.isEmpty
              ? const Center(
                  child: Text("No Data Found"),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: formController.dataList.length,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // Data
                            final item = formController.dataList[index];
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(item['date']);

                            return Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Supplier: ${item['supplier'] ?? 'No Supplier'}',
                                            style: style1,
                                          ),
                                          Text(
                                            'Date: $formattedDate',
                                            style: style,
                                          ),
                                          Text(
                                            'Weight: ${item['weight']}',
                                            style: style,
                                          ),
                                          Text(
                                            'Amount: ${item['amount']}',
                                            style: style,
                                          ),
                                          Text(
                                            'Description: ${item['description']}',
                                            style: style,
                                          ),
                                          Text(
                                            'Type: ${item['type']}',
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      kSize5,
                                      const Divider(),
                                      kSize3,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Edit Button
                                          GestureDetector(
                                            onTap: () {
                                              formController.editingIndex =
                                                  index;
                                              formController.editItem(
                                                index,
                                              );
                                              Get.to(
                                                () => LadgerFormScreen(),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kGreenColor.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Edit Ledger",
                                                  style: actionStyle,
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Delete Button
                                          GestureDetector(
                                            onTap: () {
                                              formController.deleteItem(index);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kRedColor.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Delete Ledger",
                                                  style: actionStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // IconButton(
                                          //   icon: Icon(Icons.delete),
                                          //   onPressed: () {
                                          //     formController.deleteItem(index);
                                          //   },
                                          // ),
                                        ],
                                      ),
                                      kSize10,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
