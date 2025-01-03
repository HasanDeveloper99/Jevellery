import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LadgerController extends GetxController {
  RxList dataList = [].obs; // For storing submitted data
  Rx<String?> selectedSupplier = Rx<String?>(null);
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  Rx<String?> selectedType = Rx<String?>(null);

  TextEditingController supplierController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxBool isFormValid = false.obs;
  int? editingIndex; // To keep track of the item being edited

  @override
  void onInit() {
    super.onInit();
    // Ensure form is reset when new data is added
    resetForm();
    dateController.text = selectedDate.value.toLocal().toString().split(' ')[0];

    // Listen to changes in selectedSupplier and selectedDate
    ever(selectedSupplier, (_) {
      supplierController.text = selectedSupplier.value ?? 'Choose Supplier';
      validateForm();
    });
    ever(selectedDate, (_) {
      dateController.text =
          selectedDate.value.toLocal().toString().split(' ')[0];
      validateForm();
    });
    ever(selectedType, (_) => validateForm());

    weightController.addListener(validateForm);
    amountController.addListener(validateForm);
    descriptionController.addListener(validateForm);
  }

  void resetForm() {
    // Reset the form fields only if we are adding new data (editingIndex == null)
    if (editingIndex == null) {
      supplierController.clear();
      dateController.clear();
      weightController.clear();
      amountController.clear();
      descriptionController.clear();
      selectedSupplier.value = null;
      selectedDate.value = DateTime.now();
      selectedType.value = null;
      isFormValid.value = false;
    }
  }

  void validateForm() {
    isFormValid.value = selectedSupplier.value != null &&
        weightController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedType.value != null;
  }

  void submitForm() {
    if (isFormValid.value) {
      final formData = {
        'supplier': selectedSupplier.value,
        'weight': weightController.text,
        'amount': amountController.text,
        'date': selectedDate.value,
        'description': descriptionController.text,
        'type': selectedType.value,
      };

      if (editingIndex != null) {
        dataList[editingIndex!] = formData; // Update existing item
      } else {
        dataList.add(formData); // Add new item
      }

      Get.back(); // Go back to the HomeScreen
    } else {
      Get.snackbar('Error', 'Please fill all fields');
    }
  }

  void editItem(int index) {
    editingIndex = index;
    final item = dataList[index];

    selectedSupplier.value = item['supplier'];
    selectedDate.value = item['date'];
    selectedType.value = item['type'];

    supplierController.text = item['supplier'];
    dateController.text = DateFormat('yyyy-MM-dd').format(item['date']);
    weightController.text = item['weight'];
    amountController.text = item['amount'];
    descriptionController.text = item['description'];
  }

  void deleteItem(int index) {
    dataList.removeAt(index);
  }
}
