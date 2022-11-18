// To parse this JSON data, do
//
//     final cesuTicketModel = cesuTicketModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CesuTicketModel> cesuTicketModelFromJson(String str) => List<CesuTicketModel>.from(json.decode(str).map((x) => CesuTicketModel.fromJson(x)));

String cesuTicketModelToJson(List<CesuTicketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CesuTicketModel {
  CesuTicketModel({
    required this.id,
    required this.number,
    required this.status,
    required this.createdAt,
  });

  int id;
  String number;
  int status;
  String createdAt;

  factory CesuTicketModel.fromJson(Map<String, dynamic> json) => CesuTicketModel(
    id: json["id"],
    number: json["number"],
    status: json["status"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "status": status,
    "created_at": createdAt,
  };
}
