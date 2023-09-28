// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

List<TransactionModel> transactionModelFromList(List data) =>
    List<TransactionModel>.from(data.map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  int? id;
  int? userId;
  double? amount;
  String? description;
  DateTime? transactionDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  TransactionType? transactionType;

  TransactionModel({
    this.id,
    this.amount,
    this.description,
    this.transactionDate,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.transactionType,
  });

  TransactionModel copyWith({
    double? amount,
    String? description,
    DateTime? transactionDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    TransactionType? transactionType,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        description: description ?? this.description,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        transactionType: transactionType ?? this.transactionType,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        amount: json["amount"] is double ? json['amount'] : (json['amount'] as int).toDouble(),
        description: json["description"],
        transactionDate: json["transaction_date"] == null
            ? null
            : DateTime.parse(json["transaction_date"]).toLocal(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]).toLocal(),
        userId: json["user_id"],
        transactionType: transactionTypeValues.map[json["transaction_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "description": description,
        "transaction_date": transactionDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "transaction_type": transactionTypeValues.reverse[transactionType],
      };

  Map<String, dynamic> toPost() => {
        'amount': amount,
        'transaction_type': transactionTypeValues.reverse[transactionType],
        'description': description,
        'transaction_date': transactionDate?.toIso8601String(),
      };
}

// ignore: constant_identifier_names
enum TransactionType { EXPANSE, INCOME }

final transactionTypeValues =
    EnumValues({"expanse": TransactionType.EXPANSE, "income": TransactionType.INCOME});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
