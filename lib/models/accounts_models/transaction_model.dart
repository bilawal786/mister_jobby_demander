// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  TransactionModel({
    required this.transactionId,
    required this.invoiceNo,
    required this.price,
    required this.proposalPrice,
    required this.percentage,
    required this.jobberGet,
    required this.type,
    required this.jobTitle,
  });

  int transactionId;
  String invoiceNo;
  String price;
  String proposalPrice;
  String percentage;
  String jobberGet;
  String type;
  String jobTitle;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["transaction_id"],
    invoiceNo: json["invoice_no"],
    price: json["price"],
    proposalPrice: json["proposal_price"],
    percentage: json["percentage"],
    jobberGet: json["jobber_get"],
    type: json["type"],
    jobTitle: json["job_title"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "invoice_no": invoiceNo,
    "price": price,
    "proposal_price": proposalPrice,
    "percentage": percentage,
    "jobber_get": jobberGet,
    "type": type,
    "job_title": jobTitle,
  };
}
