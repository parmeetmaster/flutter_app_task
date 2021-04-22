

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

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
}
