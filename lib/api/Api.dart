

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import 'DioClientInstance.dart';


class Api {
  Dio dio = ApiService().getclient();



  //------------------------------------------categories-------------------------------------------------
  Future<Response> getCategories() async {

    return await dio.get(
      "/get_categories.php",
      options: Options(contentType: "application/x-www-form-urlencoded"),
    );
  }

  Future<Response> uploadData(String name, String description, String expiry, List<File> images) async {
    

    FormData formData = FormData.fromMap({"category_id": 1,
      "name": "anxjbxhachjvacgvaghcvagvcavcagc",
      "desc": "xaxasxaxaxasxasbhxvashjxagsxghasxghacxcasgcxghascxghascxghascgxcasx",
      "expiry": "2021:04:22 4:25:03",
      "product_image[0]":await MultipartFile.fromFile(images[0].path,
        filename: basename(images[0].path),)
    });


    return await dio.post(
      "/save_user.php",
      data:formData,
      options: Options(contentType: "application/x-www-form-urlencoded"),
    );


  }
}
