import 'dart:convert';

class Gym {
  String? uuid;
  String? name;
  Address? address;
  String? phone;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Gym({
    this.uuid,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Gym.fromRawJson(String str) => Gym.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
        uuid: json["uuid"],
        name: json["name"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        email: json["email"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "address": address?.toJson(),
        "phone": phone,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Address {
  String? uuid;
  String? street;
  String? building;
  String? zip;
  String? neighborhood;
  String? city;
  String? state;
  String? country;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Address({
    this.uuid,
    this.street,
    this.building,
    this.zip,
    this.neighborhood,
    this.city,
    this.state,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        uuid: json["uuid"],
        street: json["street"],
        building: json["building"],
        zip: json["zip"],
        neighborhood: json["neighborhood"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
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
        "street": street,
        "building": building,
        "zip": zip,
        "neighborhood": neighborhood,
        "city": city,
        "state": state,
        "country": country,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
