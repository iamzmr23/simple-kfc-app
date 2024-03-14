import 'dart:convert';

List<KFCModel> kfcModelFromJson(String str) => List<KFCModel>.from(json.decode(str).map((x) => KFCModel.fromJson(x)));

String kfcModelToJson(List<KFCModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KFCModel {
  final String image;
  final String title;
  final String subtitle;
  int count;
  final String price;

  KFCModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.price,
  });

  factory KFCModel.fromJson(Map<String, dynamic> json) => KFCModel(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
        count: json["count"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
        "count": count,
        "price": price,
      };
}
