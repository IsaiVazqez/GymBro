import 'dart:convert';

import 'package:gymbro/common/models/gym_model.dart';

class Plan {
  Gym gym;
  List<PlanElement> plans;

  Plan({
    required this.gym,
    required this.plans,
  });

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        gym: Gym.fromJson(json["gym"]),
        plans: List<PlanElement>.from(
            json["plans"].map((x) => PlanElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gym": gym.toJson(),
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
      };
}

class PlanElement {
  Id id;
  String uuid;
  String title;
  String description;
  int duration;
  int price;
  String gym;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  PlanElement({
    required this.id,
    required this.uuid,
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.gym,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PlanElement.fromRawJson(String str) =>
      PlanElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanElement.fromJson(Map<String, dynamic> json) => PlanElement(
        id: Id.fromJson(json["_id"]),
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        price: json["price"],
        gym: json["gym"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "description": description,
        "duration": duration,
        "price": price,
        "gym": gym,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Id {
  Id();

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  // Esta fábrica ahora puede manejar objetos vacíos.
  factory Id.fromJson(Map<String, dynamic> json) => Id();

  Map<String, dynamic> toJson() => {};
}
