import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/button.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Parties/Supplier/Controller/supplier_credit_controller.dart';

class SupplierCreditForm extends StatelessWidget {
  final SupplierCreditController controller =
      Get.put(SupplierCreditController());

  SupplierCreditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade300,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          title: const Text("Add Credit Entry"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Picker
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
                      controller.selectedDate.value.toString().split(' ')[0],
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                kSize15,

                // Amount Field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextField(
                    controller: controller.amountController,
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

                // Animated Dropdown Button

                AnimatedDropdown(
                  items: const ["Gram", "Kg"],
                  selectedItem: controller.selectedUnit.value,
                  onChanged: (String newValue) {
                    controller.setSelectedUnit(newValue);
                  },
                ),

                kSize15,

                // Weight Field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextField(
                    controller: controller.weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Weight / Fine",
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

                // Description Field
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextField(
                    controller: controller.descriptionController,
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

                kSize20,

                // Submit Button
                CommanButton(
                  buttonText: "Add Credit Entry",
                  onTap: () {
                    controller.submitForm();
                  },
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
