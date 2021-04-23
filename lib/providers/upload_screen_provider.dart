import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/api/Api.dart';
import 'package:flutter_app_task/globals/constants.dart';
import 'package:flutter_app_task/model/product_categories.dart';
import 'package:flutter_app_task/utils/app_logger.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadScreenProvider extends ChangeNotifier {
  List<Category> categories;
  dynamic currunt_state = appstate.defaultstate;

  List<String> listItemsForSelection;

  TextEditingController expiryController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  List<File> images = [];
  File image;
  int catagoryNumber;
  Category activeCategory;
  GlobalKey<ScaffoldState> key;
  DateTime expireDate;

  reset() {
    categories = null;
    currunt_state = appstate.defaultstate;

    listItemsForSelection = null;

    expiryController = new TextEditingController();
    nameController = new TextEditingController();
    descriptionController = new TextEditingController();
    images = [];
    image = null;
    catagoryNumber = null;
    activeCategory = null;
    expireDate = null;
  }

  init() async {
    listItemsForSelection = [];
    Response response = await Api().getCategories();
    ProductCategories model =
        ProductCategories.fromJson(jsonDecode(response.data));

    List<Category> ls = model.categories;
    this.categories = ls;
    for (Category category in ls) {
      listItemsForSelection.add(category.name);
    }

    currunt_state = appstate.loading_complete;
    notifyListeners();
  }

  void setDate(DateTime picked) {
    expireDate = picked;
    String expiryString = DateFormat("dd-MM-yyyy").format(picked).toString();
    expiryController.text = expiryString;
  }

  void pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      images.add(image);
    } else {
      print('No image selected.');
    }

    notifyListeners();
  }

  void onremove(int index) {
    AppLogger.print("remove item index${index}");
    images.removeAt(index);
    notifyListeners();
  }

  showMessage(String message) {
    key.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  onsubmit() async {
    if (activeCategory == null) {
      showMessage("Please select least one Category");
      return;
    }

    if (nameController.text.isEmpty) {
      showMessage("Please provider name");
      return;
    }
    if (descriptionController.text.isEmpty) {
      showMessage("Please provider description");
      return;
    }
    if (expiryController.text.isEmpty) {
      showMessage("Please provider Expire date");
      return;
    }

    if (images.length < 1) {
      showMessage("Please add few images");
      return;
    }

    List<MultipartFile> multipartImages = [];
    for (int i = 0; i < images.length; i++) {
      MultipartFile file = await MultipartFile.fromFile(images[0].path,
          filename: basename(images[i].path));
      multipartImages.add(file);
    }

    Response response = await Api().uploadData(
        activeCategory.id,
        nameController.text,
        descriptionController.text,
        expireDate.toString(),
        images,
        multipartImages);

    if (response.statusCode == 200) {
      showMessage("Data upload Successfully");
    }
  }

  void selectedCategoryItem(String str) {
    for (Category item in categories) {
      if (item.name.contains(str)) {
        activeCategory = item;
        break;
      }
    }
  }
}
