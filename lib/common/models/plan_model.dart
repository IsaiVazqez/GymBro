import 'dart:convert';

class Plan {
  String? uuid;
  String? name;
  Address? address;
  String? phone;
  String? email;
  List<dynamic>? socialMedia;
  List<dynamic>? operatingHours;
  List<dynamic>? policies;
  List<dynamic>? rules;
  String? gym;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<PlanElement>? plans;

  Plan({
    this.uuid,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.socialMedia,
    this.operatingHours,
    this.policies,
    this.rules,
    this.gym,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.plans,
  });

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        uuid: json["uuid"],
        name: json["name"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        email: json["email"],
        socialMedia: json["socialMedia"] == null
            ? []
            : List<dynamic>.from(json["socialMedia"]!.map((x) => x)),
        operatingHours: json["operatingHours"] == null
            ? []
            : List<dynamic>.from(json["operatingHours"]!.map((x) => x)),
        policies: json["policies"] == null
            ? []
            : List<dynamic>.from(json["policies"]!.map((x) => x)),
        rules: json["rules"] == null
            ? []
            : List<dynamic>.from(json["rules"]!.map((x) => x)),
        gym: json["gym"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        plans: json["plans"] == null
            ? []
            : List<PlanElement>.from(
                json["plans"]!.map((x) => PlanElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "address": address?.toJson(),
        "phone": phone,
        "email": email,
        "socialMedia": socialMedia == null
            ? []
            : List<dynamic>.from(socialMedia!.map((x) => x)),
        "operatingHours": operatingHours == null
            ? []
            : List<dynamic>.from(operatingHours!.map((x) => x)),
        "policies":
            policies == null ? [] : List<dynamic>.from(policies!.map((x) => x)),
        "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
        "gym": gym,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "plans": plans == null
            ? []
            : List<dynamic>.from(plans!.map((x) => x.toJson())),
      };
}

class Address {
  Id? id;
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
    this.id,
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
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
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
        "_id": id?.toJson(),
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

class Id {
  Id();

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id();

  Map<String, dynamic> toJson() => {};
}

class PlanElement {
  String? uuid;
  String? title;
  String? description;
  int? duration;
  int? price;
  String? branch;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PlanElement({
    this.uuid,
    this.title,
    this.description,
    this.duration,
    this.price,
    this.branch,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PlanElement.fromRawJson(String str) =>
      PlanElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanElement.fromJson(Map<String, dynamic> json) => PlanElement(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        price: json["price"],
        branch: json["branch"],
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
        "title": title,
        "description": description,
        "duration": duration,
        "price": price,
        "branch": branch,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
