import 'package:get/get.dart';

class Supplier {
  String name;
  String mobile;
  String city;

  Supplier({
    required this.name,
    required this.mobile,
    required this.city,
  });
}

class SupplierFormController extends GetxController {
  var name = ''.obs;
  var mobile = ''.obs;
  var city = ''.obs;
  var isFormSubmitted = false.obs;

  // Supplier List

  var suppliers = <Supplier>[].obs;
  var supplierEditing = false.obs;
  var editingSupplierIndex = (-1).obs;

  bool get isFormValid =>
      name.isNotEmpty && mobile.isNotEmpty && city.isNotEmpty;

  void submitForm() {
    if (supplierEditing.value) {
      suppliers[editingSupplierIndex.value] = Supplier(
        name: name.value,
        mobile: mobile.value,
        city: city.value,
      );
      supplierEditing.value = false;
      editingSupplierIndex.value = -1;
    } else {
      suppliers.insert(
          0,
          Supplier(
            name: name.value,
            mobile: mobile.value,
            city: city.value,
          ));
    }
    // Reset form fields
    name.value = '';
    mobile.value = '';
    city.value = '';
    isFormSubmitted.value = true;
  }

  void editSupplier(int index) {
    // Set form fields with selected customer data
    var supplier = suppliers[index];
    name.value = supplier.name;
    mobile.value = supplier.mobile;
    city.value = supplier.city;

    // Set editing mode and index
    supplierEditing.value = true;
    editingSupplierIndex.value = index;
  }

  void deleteSupplier(int index) {
    suppliers.removeAt(index);
  }
}
