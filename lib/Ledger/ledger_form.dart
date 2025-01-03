import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Ledger/ledger_controller.dart'; // Assuming this import is required for the controller

class LadgerFormScreen extends StatelessWidget {
  final formController = Get.put(LadgerController());

  final errorStyle = const TextStyle(
    fontSize: 17,
    color: kWhiteColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    // overflow: TextOverflow.ellipsis,
  );

  LadgerFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Reset the form if it's for a new entry, else edit the existing entry
    if (formController.editingIndex == null) {
      formController.resetForm(); // Reset form for new data
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          title: Text(
            formController.editingIndex == null ? 'Add Data' : 'Edit Data',
            style: const TextStyle(
              fontFamily: kFontFamily,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Supplier Selection Field
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: TextFormField(
                  controller: formController.supplierController,
                  readOnly: true,
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: kFontFamily,
                    color: kBlackColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    hintText: 'Select Supplier',
                  ),
                  onTap: () {
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
                        child: ListView(
                          padding: const EdgeInsets.only(top: 10),
                          children: [
                            'Supplier One',
                            'Supplier Two',
                            'Supplier Three'
                          ]
                              .map((name) => GestureDetector(
                                    onTap: () {
                                      formController.selectedSupplier.value =
                                          name;
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontFamily: kFontFamily,
                                              fontSize: 17,
                                              color: kBlackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              kSize15,
              // Date Picker Field
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: TextFormField(
                  controller: formController.dateController,
                  readOnly: true,
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: kFontFamily,
                    color: kBlackColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: formController.selectedDate.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      formController.selectedDate.value = pickedDate;
                    }
                  },
                ),
              ),

              // Weight Field
              // TextFormField(
              //   controller: formController.weightController,
              //   decoration: InputDecoration(labelText: 'Weight'),
              //   keyboardType: TextInputType.number,
              // ),

              // Amount Field
              // TextFormField(
              //   controller: formController.amountController,
              //   decoration: InputDecoration(labelText: 'Amount'),
              //   keyboardType: TextInputType.number,
              // ),

              // Description Field
              // TextFormField(
              //   controller: formController.descriptionController,
              //   decoration: InputDecoration(labelText: 'Description'),
              // ),
              kSize15,
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: TextFormField(
                  controller: formController.weightController,
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
              kSize15,
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: TextFormField(
                  controller: formController.amountController,
                  keyboardType: TextInputType.number,
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
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: TextFormField(
                  controller: formController.descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Description",
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
              // Animated Dropdown for Type (Credit/Debit)
              Obx(() => CustomDropdownButton(
                    options: const ['Credit', 'Debit'],
                    selectedValue: formController.selectedType.value ?? '',
                    onChanged: (value) {
                      formController.selectedType.value = value;
                    },
                  )),
              kSize30,
              // Submit or Edit Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: formController.isFormValid.value
                        ? formController.submitForm
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
                              margin: const EdgeInsets.all(15.0),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: formController.isFormValid.value
                          ? kButtonColor
                          : const Color.fromARGB(255, 126, 118, 241),
                    ),
                    child: Text(
                      formController.editingIndex == null
                          ? 'Add Ladger'
                          : 'Edit Ladger',
                      style: const TextStyle(
                        fontSize: 18,
                        color: kWhiteColor,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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

  const CustomDropdownButton({
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Text(
              widget.selectedValue.isEmpty
                  ? "Choose Type"
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
                          color: Colors.black,
                          fontFamily: kFontFamily,
                        ),
                      ),
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
