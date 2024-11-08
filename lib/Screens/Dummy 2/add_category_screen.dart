import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/Screens/Dummy%202/add_category_controller.dart';
import 'package:jewellery/Screens/Dummy%202/add_category_form.dart';

class HomeScreen extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            final category = controller.categoryList[index];
            return ListTile(
              title: Text(category.categoryName),
              leading:
                  Image.file(File(category.imagePath), width: 50, height: 50),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddCategoryScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}
