import 'dart:convert';

class UserProfile {
  String? email;
  String? phone;
  DateTime? birthdate;
  String? uuid;
  String? firstName;
  String? lastName;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserProfile({
    this.email,
    this.phone,
    this.birthdate,
    this.uuid,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfile.fromRawJson(String str) =>
      UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        email: json["email"],
        phone: json["phone"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        uuid: json["uuid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "birthdate": birthdate?.toIso8601String(),
        "uuid": uuid,
        "firstName": firstName,
        "lastName": lastName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
