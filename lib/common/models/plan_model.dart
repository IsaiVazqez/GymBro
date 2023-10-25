import 'dart:convert';

import 'package:gymbro/common/models/gym_model.dart';

class Plan {
  Gym? gym;
  List<PlanElement>? plans;

  Plan({
    this.gym,
    this.plans,
  });

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        gym: json["gym"] == null ? null : Gym.fromJson(json["gym"]),
        plans: json["plans"] == null
            ? []
            : List<PlanElement>.from(
                json["plans"]!.map((x) => PlanElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gym": gym?.toJson(),
        "plans": plans == null
            ? []
            : List<dynamic>.from(plans!.map((x) => x.toJson())),
      };
}

class PlanElement {
  String? uuid;
  String? gym; // Cambiado a String
  String? title;
  String? description;
  int? duration;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PlanElement({
    this.uuid,
    this.gym,
    this.title,
    this.description,
    this.duration,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PlanElement.fromJson(Map<String, dynamic> json) => PlanElement(
        uuid: json["uuid"],
        gym: json["gym"], // Cambiado a String
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        price: json["price"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "gym": gym, // Cambiado a String
        "title": title,
        "description": description,
        "duration": duration,
        "price": price,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
