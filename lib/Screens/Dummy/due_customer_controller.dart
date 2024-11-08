import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Screens/Dummy/due_customer_form_screen.dart';

class DueCustomerFormController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedCustomer = ''.obs;
  var isFormValid = false.obs;
  var formDataList = <Map<String, dynamic>>[].obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController billNoController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  List<String> dummyCustomers = [
    'Customer 1',
    'Customer 2',
    'Customer 3',
    'Customer 4',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
    'Customer 5',
  ];

  int? editIndex;

  void updateDate(DateTime date) {
    selectedDate.value = date;
    validateForm();
  }

  void validateForm() {
    isFormValid.value = selectedDate.value != null &&
        selectedCustomer.value.isNotEmpty &&
        amountController.text.isNotEmpty &&
        billNoController.text.isNotEmpty &&
        weightController.text.isNotEmpty;
  }

  void addData() {
    var data = {
      'date': selectedDate.value,
      'customerName': selectedCustomer.value,
      'amount': amountController.text,
      'billNo': billNoController.text,
      'weight': weightController.text,
    };
    if (editIndex == null) {
      formDataList.insert(
        0,
        data,
      ); // Insert new data at the beginning of the list
    } else {
      formDataList[editIndex!] = data; // Update existing data
      editIndex = null; // Reset edit mode
    }
    clearForm();
  }

  void clearForm() {
    amountController.clear();
    billNoController.clear();
    weightController.clear();
    selectedCustomer.value = '';
    selectedDate.value = DateTime.now();
    isFormValid.value = false;
  }

  // Delete data
  void deleteData(int index) {
    formDataList.removeAt(index);
  }

  // Edit data
  void editData(int index) {
    var data = formDataList[index];
    selectedDate.value = data['date'];
    selectedCustomer.value = data['customerName'];
    amountController.text = data['amount'];
    billNoController.text = data['billNo'];
    weightController.text = data['weight'];
    editIndex = index;
    Get.to(DueCustomerFormScreen());
  }

  // Customer Selection Bottom Sheet

  void openCustomerBottomSheet() {
    const style = TextStyle(
      fontSize: 17,
      color: kBlackColor,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      // overflow: TextOverflow.ellipsis,
    );
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          itemCount: dummyCustomers.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    selectedCustomer.value = dummyCustomers[index];
                    Get.back();
                    validateForm();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 15,
                      right: 15.0,
                    ),
                    child: Text(
                      dummyCustomers[index],
                      style: style,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showDetails(Map<String, dynamic> data) {
    // Style Of Fonts
    const style = TextStyle(
      fontSize: 17,
      color: kBlackColor,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      // overflow: TextOverflow.ellipsis,
    );

    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer Name: ${data['customerName']}",
              style: style,
            ),
            Text(
              "Date: ${DateFormat('dd/MM/yyyy').format(data['date'])}",
              style: style,
            ),
            Text(
              "Amount: ${data['amount']}",
              style: style,
            ),
            Text(
              "Bill No.: ${data['billNo']}",
              style: style,
            ),
            Text(
              "Weight: ${data['weight']}",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
