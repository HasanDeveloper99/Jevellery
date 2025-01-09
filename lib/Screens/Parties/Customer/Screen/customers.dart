import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Customer/Controller/customer_controller.dart';
import 'package:jewellery/Screens/Parties/Customer/Data/customer_data.dart';
import 'package:jewellery/Screens/Parties/Customer/Details/customer_details.dart';
import 'package:jewellery/Screens/Parties/Customer/Form/customer_form.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final CustomerFormController customerFormController =
      Get.put(CustomerFormController());

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
                              hintText: "Search customers",
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
              //     if (customerFormController.customers.isEmpty) {
              //       return const Center(
              //         child: Text(
              //           "No customers added yet.",
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
                        itemCount: customerDataList.length,
                        itemBuilder: (context, index) {
                          final data = customerDataList[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, right: 15.0, left: 15.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 5,
                                top: 8,
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const CustomerDetails());
                                },
                                child: ListTile(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹ 10,000",
                                        style: TextStyle(
                                          color: kDarkGreenColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "( આપવાના )",
                                        style: TextStyle(
                                          color: kDarkGreenColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
              ),
              // }),
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(CustomerFormScreen());
          },
          icon: const Icon(
            Icons.person_2_rounded,
            color: kWhiteColor,
            size: 28,
          ),
          label: const Text(
            'Add Customer',
            style: TextStyle(
              fontSize: 18,
              fontFamily: kFontFamily,
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kPinkColor,
        ),
      ),
    );
  }
}
