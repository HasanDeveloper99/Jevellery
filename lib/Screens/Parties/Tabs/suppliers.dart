import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Tabs/Controller/supplier_controller.dart';
import 'package:jewellery/Screens/Parties/Tabs/Form/suppliers_form.dart';

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
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (supplierFormController.suppliers.isEmpty) {
                  return const Center(
                    child: Text(
                      "No suppliers added yet.",
                      style: TextStyle(
                        fontSize: 17,
                        color: kBlackColor,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                return SingleChildScrollView(
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
                          itemCount: supplierFormController.suppliers.length,
                          itemBuilder: (context, index) {
                            final suppliers =
                                supplierFormController.suppliers[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Customer Name: ${suppliers.name}",
                                                style: style,
                                                maxLines: 2,
                                              ),
                                              Text(
                                                "Mobile Number: ${suppliers.mobile}",
                                                style: style,
                                                maxLines: 2,
                                              ),
                                              Text(
                                                "Customer Village: ${suppliers.city}",
                                                style: style,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Width between two widgets

                                        const SizedBox(width: 20),

                                        // Edit and Delete Button
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                supplierFormController
                                                    .editSupplier(index);
                                                Get.to(SupplierFormScreen());
                                              },
                                              child: const Icon(
                                                Icons.edit,
                                                size: 25,
                                                color: kGreenColor,
                                              ),
                                            ),
                                            kSize15,
                                            GestureDetector(
                                              onTap: () {
                                                supplierFormController
                                                    .deleteSupplier(index);
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                size: 25,
                                                color: kRedColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
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
