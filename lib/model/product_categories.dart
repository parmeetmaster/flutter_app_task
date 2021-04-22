// To parse this JSON data, do
//
//     final productCategories = productCategoriesFromJson(jsonString);

import 'dart:convert';

ProductCategories productCategoriesFromJson(String str) => ProductCategories.fromJson(json.decode(str));

String productCategoriesToJson(ProductCategories data) => json.encode(data.toJson());

class ProductCategories {
  ProductCategories({
    this.status,
    this.categories,
  });

  String status;
  List<Category> categories;

  factory ProductCategories.fromJson(Map<String, dynamic> json) => ProductCategories(
    status: json["status"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
