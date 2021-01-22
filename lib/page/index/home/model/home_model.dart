// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

class HomeModel {
  HomeModel({
    this.code,
    this.data,
    this.msg,
  });

  int code;
  Data data;
  String msg;

  factory HomeModel.fromRawJson(String str) => HomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "msg": msg,
  };
}

class Data {
  Data({
    this.banners,
    this.tabs,
  });

  List<Banners> banners;
  List<Tabs> tabs;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
    tabs: List<Tabs>.from(json["tabs"].map((x) => Tabs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
  };
}

class Banners {
  Banners({
    this.image,
    this.route,
  });

  String image;
  String route;

  factory Banners.fromRawJson(String str) => Banners.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    image: json["image"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "route": route,
  };
}

class Tabs {
  Tabs({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Tabs.fromRawJson(String str) => Tabs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tabs.fromJson(Map<String, dynamic> json) => Tabs(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
