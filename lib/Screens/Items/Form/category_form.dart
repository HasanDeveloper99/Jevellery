import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/button.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({super.key});

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyColor.shade300,
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kWhiteColor),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
              color: kBlackColor,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Add Category",
            style: TextStyle(
              fontSize: 19,
              color: kBlackColor,
              fontFamily: kFontFamily,
            ),
          ),
          backgroundColor: kTransparentColor,
          surfaceTintColor: kTransparentColor,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: kPadding15,
            child: Column(
              children: [
                kSize15,
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: TextFormField(
                    // onChanged: (value) =>
                    //     customerFormController.name.value = value,
                    // controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Category Name",
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
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 8),
                        Text(
                          "Add Image",
                          style: TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 18,
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                kSize15,
                CommanButton(
                  buttonText: "Add Category",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
