import 'dart:convert';

List<DrugsModel> drugsModelFromJson(String str) => List<DrugsModel>.from(json.decode(str).map((x) => DrugsModel.fromJson(x)));

class DrugsModel {
  DrugsModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.quantity,

  });

  int? id;
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  int? quantity;
  int count=1;

  factory DrugsModel.fromJson(Map<String, dynamic> json) => DrugsModel(
    id: json["id"]??"",
    name: json["name"]??"",
    description: json["description"]??"",
    imageUrl: json["imageUrl"],
    price: json["price"]??"",
    quantity: json["quantity"]??"",
  );
}
