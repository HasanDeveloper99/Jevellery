import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Customer/Controller/customer_debit_controller.dart';

class CustomerDebitForm extends StatelessWidget {
  final CustomerDebitController controller = Get.put(CustomerDebitController());
  CustomerDebitForm({super.key});

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
          title: const Text("Add Debit Entries"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 19,
            color: kBlackColor,
            fontFamily: kFontFamily,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.selectDate(context),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Text(
                      // controller.selectedDate.value.toString().split(' ')[0],
                      DateFormat('dd-MM-yyyy')
                          .format(controller.selectedDate.value),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w500,
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
                    controller: controller.amountController,
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

                // Gold/Silver Selection
                Row(
                  children: [
                    _buildOption(
                      "Gold",
                      isSelected: controller.selectedOption.value == "Gold",
                      onTap: () => controller.setSelectedOption("Gold"),
                    ),
                    const SizedBox(width: 15),
                    _buildOption(
                      "Silver",
                      isSelected: controller.selectedOption.value == "Silver",
                      onTap: () => controller.setSelectedOption("Silver"),
                    ),
                  ],
                ),

                kSize15,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: TextFormField(
                              controller: controller.weightController,
                              keyboardType: TextInputType.number,
                              style: style,
                              onChanged: (value) {
                                controller.updateWeightText();
                              },
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
                          controller.showWeightText.value
                              ? kSize15
                              : const SizedBox(),

                          // Showing Value Text
                          if (controller.showWeightText.value)
                            Padding(
                              padding: kPadding15,
                              child: Text(
                                controller.weightDisplayText.value,
                                style: const TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 15,
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: AnimatedDropdown(
                        items: const ["Gram", "Kg"],
                        selectedItem: controller.selectedUnit.value,
                        onChanged: (String newValue) {
                          controller.setSelectedUnit(newValue);
                          controller.updateWeightText();
                        },
                      ),
                    ),
                  ],
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
                    controller: controller.descriptionController,
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
                    controller: controller.billController,
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

                //

                kSize20,
                GestureDetector(
                  onTap: () {
                    controller.submitForm();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Center(
                        child: Text(
                      "Add Debit Entries",
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

  Widget _buildOption(String label,
      {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          color: isSelected ? kButtonColor : kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? kWhiteColor : kButtonColor,
            fontWeight: FontWeight.w500,
            fontFamily: kFontFamily,
          ),
        ),
      ),
    );
  }
}

class AnimatedDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onChanged;

  const AnimatedDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  _AnimatedDropdownState createState() => _AnimatedDropdownState();
}

class _AnimatedDropdownState extends State<AnimatedDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            height: 55,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Text(
              widget.selectedItem,
              style: const TextStyle(
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) {
                return GestureDetector(
                  onTap: () {
                    widget.onChanged(item);
                    toggleDropdown();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
