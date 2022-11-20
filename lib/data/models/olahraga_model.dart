import 'package:flutter/foundation.dart';

class Olahraga {
  String nama;
  String set;

  Olahraga({required this.nama, required this.set});

  @override
  String toString() {
    return 'Olahraga{nama: $nama, set: $set}';
  }

  factory Olahraga.fromJson(Map<String, dynamic> json) {
    return Olahraga(nama: json["nama"], set: json["set"]);
  }
}
