import 'dart:convert';

class Images {
  Id? id;
  String? uuid;
  String? name;
  String? description;
  int? qty;
  String? image;
  String? status;
  String? branch;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Images({
    this.id,
    this.uuid,
    this.name,
    this.description,
    this.qty,
    this.image,
    this.status,
    this.branch,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        qty: json["qty"],
        image: json["image"],
        status: json["status"],
        branch: json["branch"],
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
        "description": description,
        "qty": qty,
        "image": image,
        "status": status,
        "branch": branch,
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
