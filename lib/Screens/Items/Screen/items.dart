import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Items/Data/category_data.dart';
import 'package:jewellery/Screens/Items/Form/category_form.dart';
import 'package:jewellery/Screens/Notification/notification_screen.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final style = const TextStyle(
    fontFamily: kFontFamily,
    fontSize: 19,
    color: kBlackColor,
    fontWeight: FontWeight.w500,
  );

  final style1 = const TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16,
    color: kBlackColor,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor.shade200,
      ),
      child: Scaffold(
        backgroundColor: kTransparentColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kWhiteColor),
          title: const Text(
            "Category & Items",
          ),
          backgroundColor: kWhiteColor,
          surfaceTintColor: kTransparentColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(const NotificationScreen());
                },
                child: const Icon(
                  Icons.notification_add,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: kPadding15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSize15,
                Text(
                  "Category",
                  style: style,
                ),
                kSize15,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryDataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                categoryDataList[index].categoryImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            categoryDataList[index].categoryName,
                            style: style,
                          ),
                          subtitle: Text(
                            "3 Items",
                            style: style1,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(const CategoryForm());
          },
          icon: const Icon(
            Icons.add,
            color: kWhiteColor,
            size: 28,
          ),
          label: const Text(
            'Add Category',
            style: TextStyle(
              fontSize: 18,
              fontFamily: kFontFamily,
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kGreenColor,
        ),
      ),
    );
  }
}
