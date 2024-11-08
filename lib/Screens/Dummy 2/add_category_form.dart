import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewellery/Screens/Dummy%202/add_category_controller.dart';

class AddCategoryScreen extends StatelessWidget {
  final CategoryController controller = Get.find<CategoryController>();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      controller.setImageFile(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Category Name'),
              onChanged: controller.setCategoryName,
            ),
            SizedBox(height: 20),
            Obx(() {
              return controller.imageFile.value.path.isNotEmpty
                  ? Image.file(controller.imageFile.value,
                      height: 100, width: 100)
                  : SizedBox();
            }),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Upload Image'),
            ),
            Spacer(),
            Obx(() {
              return ElevatedButton(
                onPressed: (controller.categoryName.value.isNotEmpty &&
                        controller.imageFile.value.path.isNotEmpty)
                    ? () {
                        controller.addCategory(
                          CategoryModel(
                            categoryName: controller.categoryName.value,
                            imagePath: controller.imageFile.value.path,
                          ),
                        );
                        Get.back();
                      }
                    : null,
                child: Text('Save Category'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
