// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

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
  String nama;
  @HiveField(1)
  String email;
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
}
