// To parse this JSON data, do
//
//     final homeListModel = homeListModelFromJson(jsonString);

import 'dart:convert';

class HomeListModel {
  HomeListModel({
    this.code,
    this.msg,
    this.data,
  });

  int code;
  String msg;
  List<Datum> data;

  factory HomeListModel.fromRawJson(String str) => HomeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeListModel.fromJson(Map<String, dynamic> json) => HomeListModel(
    code: json["code"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.image,
  });

  String name;
  String image;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
