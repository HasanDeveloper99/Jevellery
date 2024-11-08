import 'package:get/get.dart';

class Customer {
  String name;
  String mobile;
  String village;
  String gender;

  Customer(
      {required this.name,
      required this.mobile,
      required this.village,
      required this.gender});
}

class CustomerFormController extends GetxController {
  var name = ''.obs;
  var mobile = ''.obs;
  var village = ''.obs;
  var gender = ''.obs;
  var isFormSubmitted = false.obs;

  // Customer List
  var customers = <Customer>[].obs;
  var isEditing = false.obs;
  var editingIndex = (-1).obs; // Changed int to RxInt

  bool get isFormValid =>
      name.isNotEmpty &&
      mobile.isNotEmpty &&
      village.isNotEmpty &&
      gender.isNotEmpty;

  void submitForm() {
    if (isEditing.value) {
      // Update existing customer
      customers[editingIndex.value] = Customer(
        name: name.value,
        mobile: mobile.value,
        village: village.value,
        gender: gender.value,
      );
      isEditing.value = false;
      editingIndex.value = -1;
    } else {
      // Add new customer
      customers.insert(
          0,
          Customer(
            name: name.value,
            mobile: mobile.value,
            village: village.value,
            gender: gender.value,
          ));
    }

    // Reset form fields
    name.value = '';
    mobile.value = '';
    village.value = '';
    gender.value = '';
    isFormSubmitted.value = true;
  }

  void editCustomer(int index) {
    // Set form fields with selected customer data
    var customer = customers[index];
    name.value = customer.name;
    mobile.value = customer.mobile;
    village.value = customer.village;
    gender.value = customer.gender;

    // Set editing mode and index
    isEditing.value = true;
    editingIndex.value = index;
  }

  void deleteCustomer(int index) {
    customers.removeAt(index);
  }
}
