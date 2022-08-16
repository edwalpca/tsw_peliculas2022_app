// To parse this JSON data, do
//
//     final cast = castFromMap(jsonString);

import 'dart:convert';

import 'package:tsw_peliculas2022_app/models/cast.dart';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
  });

  int id;
  List<Cast> cast;

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
      );
}
