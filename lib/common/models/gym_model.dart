import 'dart:convert';

class Gym {
  Id id;
  String uuid;
  String name;
  String description;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  var calificacion;

  Gym({
    required this.id,
    required this.uuid,
    required this.name,
    required this.description,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.calificacion = 5.0,
  });

  factory Gym.fromRawJson(String str) => Gym.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
        id: Id.fromJson(json["_id"]),
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "uuid": uuid,
        "name": name,
        "description": description,
        "address": address,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Id {
  Id();

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id();

  Map<String, dynamic> toJson() => {};
}
