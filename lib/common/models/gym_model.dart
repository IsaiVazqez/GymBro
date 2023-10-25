import 'dart:convert';

class Gym {
  String? uuid;
  String? name;
  String? description;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Gym({
    this.uuid,
    this.name,
    this.description,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Gym.fromRawJson(String str) => Gym.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
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
        "name": name,
        "description": description,
        "address": address,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
