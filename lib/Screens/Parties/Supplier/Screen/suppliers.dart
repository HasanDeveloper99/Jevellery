import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Supplier/Controller/supplier_controller.dart';
import 'package:jewellery/Screens/Parties/Supplier/Data/suppliers_data.dart';
import 'package:jewellery/Screens/Parties/Supplier/Details/supplier_details.dart';
import 'package:jewellery/Screens/Parties/Supplier/Form/suppliers_form.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  final SupplierFormController supplierFormController =
      Get.put(SupplierFormController());

  final style = const TextStyle(
    fontSize: 17,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade300,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                              hintText: "Search suppliers",
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
              // Expanded(
              //   child: Obx(() {
              //     if (supplierFormController.suppliers.isEmpty) {
              //       return const Center(
              //         child: Text(
              //           "No suppliers added yet.",
              //           style: TextStyle(
              //             fontSize: 17,
              //             color: kBlackColor,
              //             fontFamily: kFontFamily,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       );
              //     }
              // return

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: suppliersDataList.length,
                        itemBuilder: (context, index) {
                          final data = suppliersDataList[index];

                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, right: 15.0, left: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(SupplierDetails());
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  top: 8,
                                  bottom: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ListTile
                                    ListTile(
                                      leading: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: kShapeColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              data.name.substring(0, 1),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: kWhiteColor,
                                                fontFamily: kFontFamily,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        data.name,
                                        style: const TextStyle(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      subtitle: Text(
                                        data.mobileNumber,
                                        style: TextStyle(
                                          color: kBlackColor.withOpacity(0.7),
                                        ),
                                      ),
                                      trailing: const Column(
                                        children: [
                                          Text(
                                            "₹ 10,000",
                                            style: TextStyle(
                                              color: kRedColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "( લેવાના )",
                                            style: TextStyle(
                                              color: kRedColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: kPadding15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "G.W. : 50 gram ( આપવાનું )",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: kFontFamily,
                                              fontSize: 16,
                                              color: kDarkGreenColor,
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "S.W. : 100 kg ( લેવાનું )",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: kFontFamily,
                                              fontSize: 16,
                                              color: kRedColor,
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          kSize3,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                          // return Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 15,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 15.0),
                          //     child: Container(
                          //       width: double.infinity,
                          //       decoration: BoxDecoration(
                          //         color: kWhiteColor,
                          //         borderRadius: BorderRadius.circular(15),
                          //       ),
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //           left: 10.0,
                          //           right: 10.0,
                          //           top: 10,
                          //           bottom: 10,
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Expanded(
                          //               child: Column(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     "Customer Name: ${suppliers.name}",
                          //                     style: style,
                          //                     maxLines: 2,
                          //                   ),
                          //                   Text(
                          //                     "Mobile Number: ${suppliers.mobile}",
                          //                     style: style,
                          //                     maxLines: 2,
                          //                   ),
                          //                   Text(
                          //                     "Customer Village: ${suppliers.city}",
                          //                     style: style,
                          //                     maxLines: 2,
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),

                          //             // Width between two widgets

                          //             const SizedBox(width: 20),

                          //             // Edit and Delete Button
                          //             Column(
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     supplierFormController
                          //                         .editSupplier(index);
                          //                     Get.to(SupplierFormScreen());
                          //                   },
                          //                   child: const Icon(
                          //                     Icons.edit,
                          //                     size: 25,
                          //                     color: kGreenColor,
                          //                   ),
                          //                 ),
                          //                 kSize15,
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     supplierFormController
                          //                         .deleteSupplier(index);
                          //                   },
                          //                   child: const Icon(
                          //                     Icons.delete,
                          //                     size: 25,
                          //                     color: kRedColor,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //   }),
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(SupplierFormScreen());
          },
          icon: const Icon(
            Icons.person_2_rounded,
            color: kWhiteColor,
            size: 28,
          ),
          label: const Text(
            'Add Suppliers',
            style: TextStyle(
              fontSize: 18,
              fontFamily: kFontFamily,
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kDarkGreenColor,
        ),
      ),
    );
  }
}
