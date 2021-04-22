

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/api/Api.dart';
import 'package:flutter_app_task/model/product_categories.dart';

class UploadScreenProvider extends ChangeNotifier{

  init() async {

    Response response=await Api().getCategories();
    List<Category> ls=ProductCategories.fromJson(response.data).categories;


  }




}