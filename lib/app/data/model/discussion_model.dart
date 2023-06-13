// To parse this JSON data, do
//
//     final discussionModel = discussionModelFromJson(jsonString);

import 'dart:convert';

DiscussionModel discussionModelFromJson(String str) => DiscussionModel.fromJson(json.decode(str));

String discussionModelToJson(DiscussionModel data) => json.encode(data.toJson());

class DiscussionModel {
    String? id;
    String? materialId;
    String? teacherId;
    String? title;
    String? content;
    DateTime? createdAt;
    DateTime? updatedAt;

    DiscussionModel({
        this.id,
        this.materialId,
        this.teacherId,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
    });

    factory DiscussionModel.fromJson(Map<String, dynamic> json) => DiscussionModel(
        id: json["id"],
        materialId: json["material_id"],
        teacherId: json["teacher_id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "material_id": materialId,
        "teacher_id": teacherId,
        "title": title,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
