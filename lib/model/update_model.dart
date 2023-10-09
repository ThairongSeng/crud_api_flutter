import 'dart:convert';

RestaurantUpdateModel restaurantUpdateModelFromJson(String str) => RestaurantUpdateModel.fromJson(json.decode(str));

String restaurantUpdateModelToJson(RestaurantUpdateModel data) => json.encode(data.toJson());

class RestaurantUpdateModel {
  Data? data;

  RestaurantUpdateModel({
    this.data,
  });

  factory RestaurantUpdateModel.fromJson(Map<String, dynamic> json) => RestaurantUpdateModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? category;
  int? discount;
  double? deliveryFee;
  int? deliveryTime;
  String? picture;

  Data({
    this.name,
    this.category,
    this.discount,
    this.deliveryFee,
    this.deliveryTime,
    this.picture,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    category: json["category"],
    discount: json["discount"],
    deliveryFee: json["deliveryFee"]?.toDouble(),
    deliveryTime: json["deliveryTime"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "discount": discount,
    "deliveryFee": deliveryFee,
    "deliveryTime": deliveryTime,
    "picture": picture,
  };
}