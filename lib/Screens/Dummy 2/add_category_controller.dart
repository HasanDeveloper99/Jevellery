import 'dart:io';
import 'package:get/get.dart';

class CategoryModel {
  String categoryName;
  String imagePath;

  CategoryModel({required this.categoryName, required this.imagePath});
}

class CategoryController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  var categoryName = ''.obs;
  var imageFile = File('').obs;

  void addCategory(CategoryModel category) {
    categoryList.add(category);
  }

  void setImageFile(File file) {
    imageFile.value = file;
  }

  void setCategoryName(String name) {
    categoryName.value = name;
  }
}
