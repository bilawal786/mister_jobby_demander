// To parse this JSON data, do
//
//     final myBalanceModel = myBalanceModelFromJson(jsonString);

import 'dart:convert';

MyBalanceModel myBalanceModelFromJson(String str) => MyBalanceModel.fromJson(json.decode(str));

String myBalanceModelToJson(MyBalanceModel data) => json.encode(data.toJson());

class MyBalanceModel {
  MyBalanceModel({
    required this.wallet,
    required this.details,
  });

  String wallet;
  List<Detail> details;

  factory MyBalanceModel.fromJson(Map<String, dynamic> json) => MyBalanceModel(
    wallet: json["wallet"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.walletId,
    required this.amount,
    required this.paymentType,
    required this.transactionType,
    required this.createdAt,
  });

  int walletId;
  String amount;
  String paymentType;
  String transactionType;
  String createdAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    walletId: json["wallet_id"],
    amount: json["amount"],
    paymentType: json["payment_type"],
    transactionType: json["transaction_type"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_id": walletId,
    "amount": amount,
    "payment_type": paymentType,
    "transaction_type": transactionType,
    "created_at": createdAt,
  };
}
