// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    required this.nama,
    required this.email,
    required this.hieght,
    required this.weight,
    required this.dob,
    required this.pob,
    required this.gender,
  });

  @HiveField(0)
  String? nama;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String hieght;
  @HiveField(3)
  String weight;
  @HiveField(4)
  String dob;
  @HiveField(5)
  String pob;
  @HiveField(6)
  String gender;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        email: json["email"],
        hieght: json["hieght"],
        weight: json["weight"],
        dob: json["dob"],
        pob: json["pob"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "hieght": hieght,
        "weight": weight,
        "dob": dob,
        "pob": pob,
        "gender": gender,
      };
}
