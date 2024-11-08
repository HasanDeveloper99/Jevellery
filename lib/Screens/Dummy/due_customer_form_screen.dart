import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Dummy/due_customer_controller.dart';
import 'package:intl/intl.dart';

class DueCustomerFormScreen extends StatelessWidget {
  final DueCustomerFormController dueCustomerFormController =
      Get.find<DueCustomerFormController>();

  final style = const TextStyle(
    fontSize: 17,
    color: kBlackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    // overflow: TextOverflow.ellipsis,
  );

  final errorStyle = const TextStyle(
    fontSize: 17,
    color: kWhiteColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    // overflow: TextOverflow.ellipsis,
  );

  DueCustomerFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          title: const Text("Form Screen"),
          backgroundColor: kTransparentColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Date field with customized format
                Obx(() => Container(
                      height: 55,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Date',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        controller: TextEditingController(
                          text: DateFormat('dd/MM/yyyy').format(
                              dueCustomerFormController.selectedDate.value),
                        ),
                        onTap: () async {
                          final selected = await showDatePicker(
                            context: context,
                            initialDate:
                                dueCustomerFormController.selectedDate.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selected != null) {
                            dueCustomerFormController.updateDate(selected);
                          }
                        },
                      ),
                    )),

                kSize15,
                // Customer Name field
                Obx(() => GestureDetector(
                      onTap: () =>
                          dueCustomerFormController.openCustomerBottomSheet(),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dueCustomerFormController
                                      .selectedCustomer.value.isNotEmpty
                                  ? dueCustomerFormController
                                      .selectedCustomer.value
                                  : 'Select Customer',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: kFontFamily,
                                color: dueCustomerFormController
                                        .selectedCustomer.value.isNotEmpty
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 25,
                              color: dueCustomerFormController
                                      .selectedCustomer.value.isNotEmpty
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    )),
                kSize15,

                // Amount field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (_) => dueCustomerFormController.validateForm(),
                    controller: dueCustomerFormController.amountController,
                    decoration: const InputDecoration(
                      hintText: "Amount",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontFamily: kFontFamily,
                        fontSize: 17,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: kFontFamily,
                    ),
                  ),
                ),
                kSize15,

                // Bill No. field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (_) => dueCustomerFormController.validateForm(),
                    controller: dueCustomerFormController.billNoController,
                    decoration: const InputDecoration(
                      hintText: "Bill No.",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontFamily: kFontFamily,
                        fontSize: 17,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: kFontFamily,
                    ),
                  ),
                ),
                kSize15,

                // Weight field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (_) => dueCustomerFormController.validateForm(),
                    controller: dueCustomerFormController.weightController,
                    decoration: const InputDecoration(
                      hintText: "Weight",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontFamily: kFontFamily,
                        fontSize: 17,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: kFontFamily,
                    ),
                  ),
                ),

                kSize20,

                // Submit button with Obx for validation
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: dueCustomerFormController.isFormValid.value
                          ? () {
                              dueCustomerFormController.addData();
                              Get.back();
                            }
                          : () {
                              Get.snackbar(
                                "Error",
                                "Please fill all fields to submit.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: kRedColor,
                                titleText: Text(
                                  "Error",
                                  style: errorStyle,
                                ),
                                messageText: Text(
                                  "Please Fill The All Required Field",
                                  style: errorStyle,
                                ),
                                margin: EdgeInsets.all(15.0),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor:
                            dueCustomerFormController.isFormValid.value
                                ? kButtonColor
                                : const Color.fromARGB(255, 126, 118, 241),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w500,
                          color: dueCustomerFormController.isFormValid.value
                              ? kWhiteColor
                              : kWhiteColor,
                        ),
                      ),
                    ),
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
