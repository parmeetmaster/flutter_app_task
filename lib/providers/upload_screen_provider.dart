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

class UploadScreenProvider extends ChangeNotifier {
  List<Category> ls;
  dynamic currunt_state = appstate.defaultstate;

  List<String> listItemsForSelection;

  TextEditingController expiryController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  List<File> images = [];
  File image;

  init() async {
    listItemsForSelection = [];
    Response response = await Api().getCategories();
    ProductCategories model =
        ProductCategories.fromJson(jsonDecode(response.data));

    List<Category> ls = model.categories;
    this.ls = ls;
    for (Category category in ls) {
      listItemsForSelection.add(category.name);
    }

    currunt_state = appstate.loading_complete;
    notifyListeners();
  }

  void setDate(DateTime picked) {
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



  onsubmit() async{
 Response response=  await Api().uploadData(nameController.text,descriptionController.text,expiryController.text,images);

  }

}
