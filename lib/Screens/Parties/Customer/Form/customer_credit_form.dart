import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';

class CustomerCreditForm extends StatefulWidget {
  const CustomerCreditForm({super.key});

  @override
  _CustomerCreditFormState createState() => _CustomerCreditFormState();
}

class _CustomerCreditFormState extends State<CustomerCreditForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _billNoController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  void _pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  void _addCredit() {
    if (_dateController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _billNoController.text.isEmpty ||
        _weightController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields correctly",
        backgroundColor: kRedColor,
        colorText: kWhiteColor,
        titleText: const Text(
          "Error",
          style: const TextStyle(
            fontSize: 18,
            color: kWhiteColor,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        messageText: const Text(
          "Please fill all fields correctly",
          style: TextStyle(
            fontSize: 15,
            color: kWhiteColor,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // All fields are filled
      print("Credit Added Successfully");
      print("Date: ${_dateController.text}");
      print("Amount: ${_amountController.text}");
      print("Description: ${_descriptionController.text}");
      print("Bill No: ${_billNoController.text}");
      print("Weight: ${_weightController.text}");
    }
  }

  final style = const TextStyle(
    fontSize: 18,
    fontFamily: kFontFamily,
  );

  final hintTextStyle = const TextStyle(
    color: Colors.black87,
    fontFamily: kFontFamily,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyColor.shade300,
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          title: const Text("Add Credit Entries"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 19,
            color: kGreenColor,
            fontFamily: kFontFamily,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                        ),
                        style: style,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a date";
                          }
                          return null;
                        },
                      ),
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
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: style,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Amount',
                      hintStyle: hintTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
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
                    controller: _descriptionController,
                    style: style,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Description',
                      hintStyle: hintTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
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
                    controller: _billNoController,
                    keyboardType: TextInputType.number,
                    style: style,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Bill Number',
                      hintStyle: hintTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
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
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: style,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Weight',
                      hintStyle: hintTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                kSize20,
                GestureDetector(
                  onTap: _addCredit,
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Center(
                        child: Text(
                      "Add Credit Entries",
                      style: TextStyle(
                        fontSize: 18,
                        color: kWhiteColor,
                        fontFamily: kFontFamily,
                      ),
                    )),
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
