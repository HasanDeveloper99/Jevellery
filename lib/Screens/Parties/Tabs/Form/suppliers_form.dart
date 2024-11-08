import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Tabs/Controller/supplier_controller.dart';

class SupplierFormScreen extends StatelessWidget {
  final supplierFormController = Get.find<SupplierFormController>();

  // TextEditingControllers for each form field
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final cityController = TextEditingController();
  SupplierFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (supplierFormController.supplierEditing.value) {
      nameController.text = supplierFormController.name.value;
      mobileController.text = supplierFormController.mobile.value;
      cityController.text = supplierFormController.city.value;
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          title: const Text(
            'Add Supplier',
            style: TextStyle(
              fontFamily: kFontFamily,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) =>
                        supplierFormController.name.value = value,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Supplier Name",
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
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) =>
                        supplierFormController.mobile.value = value,
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Mobile Number",
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
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) =>
                        supplierFormController.city.value = value,
                    controller: cityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Supplier City",
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
                kSize30,
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: supplierFormController.isFormValid
                          ? () {
                              supplierFormController.submitForm();
                              Get.back();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: supplierFormController.isFormValid
                            ? kButtonColor
                            : const Color.fromARGB(255, 126, 118, 241),
                      ),
                      child: const Text(
                        'Add Supplier',
                        style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
