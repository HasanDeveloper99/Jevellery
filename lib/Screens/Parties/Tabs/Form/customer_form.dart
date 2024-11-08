import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Tabs/Controller/customer_controller.dart';
// import 'form_controller.dart';

class CustomerFormScreen extends StatelessWidget {
  final customerFormController = Get.find<CustomerFormController>();

  // TextEditingControllers for each form field
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final villageController = TextEditingController();

  CustomerFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set TextEditingController values if in editing mode
    if (customerFormController.isEditing.value) {
      nameController.text = customerFormController.name.value;
      mobileController.text = customerFormController.mobile.value;
      villageController.text = customerFormController.village.value;
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
            'Add Customer',
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
                // TextField(
                //   controller: nameController,
                //   decoration: const InputDecoration(labelText: 'Name'),
                //   onChanged: (value) => customerFormController.name.value = value,
                // ),
                // TextField(
                //   controller: mobileController,
                //   decoration: const InputDecoration(labelText: 'Mobile Number'),
                //   keyboardType: TextInputType.number,
                //   onChanged: (value) => customerFormController.mobile.value = value,
                // ),
                // TextField(
                //   controller: villageController,
                //   decoration: const InputDecoration(labelText: 'Village'),
                //   onChanged: (value) => customerFormController.village.value = value,
                // ),
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) =>
                        customerFormController.name.value = value,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Customer Name",
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
                        customerFormController.mobile.value = value,
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
                        customerFormController.village.value = value,
                    controller: villageController,
                    decoration: const InputDecoration(
                      hintText: "Customer Village",
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
                const SizedBox(height: 20),
                Obx(() {
                  return CustomDropdownButton(
                    options: const ['Male', 'Female'],
                    selectedValue: customerFormController.gender.value,
                    onChanged: (value) {
                      customerFormController.gender.value = value;
                    },
                  );
                }),
                kSize30,
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: customerFormController.isFormValid
                          ? () {
                              customerFormController.submitForm();
                              Get.back();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: customerFormController.isFormValid
                            ? kButtonColor
                            : const Color.fromARGB(255, 126, 118, 241),
                      ),
                      child: const Text(
                        'Add Customer',
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

class CustomDropdownButton extends StatefulWidget {
  final List<String> options;
  final String selectedValue;
  final ValueChanged<String> onChanged;

  CustomDropdownButton({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool isOpen = false;

  void toggleDropdown() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            height: 55,
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(13.0),
              // border: Border.all(color: Colors.grey),
            ),
            child: Text(
              widget.selectedValue.isEmpty
                  ? "Choose Gender"
                  : widget.selectedValue,
              style: TextStyle(
                color:
                    widget.selectedValue.isEmpty ? Colors.grey : Colors.black,
                fontSize: 18,
                fontFamily: kFontFamily,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isOpen ? 100 : 0,
          child: isOpen
              ? ListView(
                  children: widget.options.map((option) {
                    return ListTile(
                      dense: true,
                      title: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 16,
                          color: kBlackColor,
                          fontFamily: kFontFamily,
                        ),
                      ),
                      // contentPadding: EdgeInsets.symmetric(vertical: 10),
                      onTap: () {
                        widget.onChanged(option);
                        toggleDropdown();
                      },
                    );
                  }).toList(),
                )
              : Container(),
        ),
      ],
    );
  }
}
