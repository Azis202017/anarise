// To parse this JSON data, do
//
//     final summaryModel = summaryModelFromJson(jsonString);

import 'dart:convert';

SummaryModel summaryModelFromJson(String str) => SummaryModel.fromJson(json.decode(str));

String summaryModelToJson(SummaryModel data) => json.encode(data.toJson());

class SummaryModel {
    String? id;
    String? materialId;
    String? front;
    String? back;
    DateTime? createdAt;
    DateTime? updatedAt;

    SummaryModel({
        this.id,
        this.materialId,
        this.front,
        this.back,
        this.createdAt,
        this.updatedAt,
    });

    factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
        id: json["id"],
        materialId: json["material_id"],
        front: json["front"],
        back: json["back"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "material_id": materialId,
        "front": front,
        "back": back,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
