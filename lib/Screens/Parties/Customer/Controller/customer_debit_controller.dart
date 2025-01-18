import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';

class CustomerDebitController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedOption = "Gold".obs;
  var selectedUnit = "Gram".obs;

  TextEditingController weightController = TextEditingController();
  TextEditingController billController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void setSelectedOption(String value) {
    selectedOption.value = value;
  }

  void setSelectedUnit(String value) {
    selectedUnit.value = value;
  }

  void submitForm() {
    if (weightController.text.isEmpty ||
        amountController.text.isEmpty ||
        billController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        titleText: const Text(
          "Error",
          style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: 18,
            color: kWhiteColor,
          ),
        ),
        messageText: const Text(
          "Please fill all fields",
          style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: 16,
            color: kWhiteColor,
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      "Success",
      "Form submitted successfully!",
      titleText: const Text(
        "Success",
        style: TextStyle(
          fontFamily: kFontFamily,
          fontSize: 18,
          color: kWhiteColor,
        ),
      ),
      messageText: const Text(
        "Form submitted successfully!",
        style: TextStyle(
          fontFamily: kFontFamily,
          fontSize: 16,
          color: kWhiteColor,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
