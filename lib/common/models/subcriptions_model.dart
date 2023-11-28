import 'dart:convert';

class Subcriptions {
  String? uuid;
  String? status;
  Plan? plan;
  Branch? branch;
  DateTime? createdAt;
  DateTime? updatedAt;

  Subcriptions({
    this.uuid,
    this.status,
    this.plan,
    this.branch,
    this.createdAt,
    this.updatedAt,
  });

  factory Subcriptions.fromRawJson(String str) =>
      Subcriptions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subcriptions.fromJson(Map<String, dynamic> json) => Subcriptions(
        uuid: json["uuid"],
        status: json["status"],
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "status": status,
        "plan": plan?.toJson(),
        "branch": branch?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Branch {
  Id? id;
  String? uuid;
  String? name;
  String? address;
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

  Branch({
    this.id,
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
  });

  factory Branch.fromRawJson(String str) => Branch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        uuid: json["uuid"],
        name: json["name"],
        address: json["address"],
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
      );

  Map<String, dynamic> toJson() => {
        "_id": id?.toJson(),
        "uuid": uuid,
        "name": name,
        "address": address,
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
      };
}

class Id {
  Id();

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id();

  Map<String, dynamic> toJson() => {};
}

class Plan {
  Id? id;
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

  Plan({
    this.id,
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

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
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
        "_id": id?.toJson(),
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
