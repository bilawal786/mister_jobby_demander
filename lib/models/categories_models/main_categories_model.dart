// To parse this JSON data, do
//
//     final mainCategoriesModel = mainCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<MainCategoriesModel> mainCategoriesModelFromJson(String str) => List<MainCategoriesModel>.from(json.decode(str).map((x) => MainCategoriesModel.fromJson(x)));

String mainCategoriesModelToJson(List<MainCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategoriesModel {
  MainCategoriesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.subCategories,
  });

  int id;
  String title;
  String image;
  List<SubCategory> subCategories;

  factory MainCategoriesModel.fromJson(Map<String, dynamic> json) => MainCategoriesModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.title,
    required this.image,
    this.price,
    required this.childCategories,
  });

  int id;
  String title;
  String image;
  dynamic price;
  List<ChildCategory> childCategories;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    price: json["price"],
    childCategories: List<ChildCategory>.from(json["child_categories"].map((x) => ChildCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "price": price,
    "child_categories": List<dynamic>.from(childCategories.map((x) => x.toJson())),
  };
}

class ChildCategory {
  ChildCategory({
    required this.id,
    required this.title,
    required this.price,
    required this.img,
  });

  int id;
  String title;
  String price;
  String img;

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "img": img,
  };
}
