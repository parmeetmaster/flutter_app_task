

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

  Future<Response> uploadData(String category,String name, String description, String expiry, List<File> images,List<MultipartFile> multiImages) async {
    Map<String, dynamic> map= {"category_id": int.parse(category),
    "name": name,
    "desc": description,
    "expiry": expiry,
    };

    for(int i=0;i<images.length;i++){
      map.putIfAbsent("product_image[${i}]", () => multiImages[i]);
    }


  /*  await MultipartFile.fromFile(images[0].path,
        filename: basename(images[0].path));*/



    FormData formData = FormData.fromMap(map);


    return await dio.post(
      "/save_user.php",
      data:formData,
      options: Options(contentType: "application/x-www-form-urlencoded"),
    );


  }
}
