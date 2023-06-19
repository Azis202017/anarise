// To parse this JSON data, do
//
//     final quizDetailModel = quizDetailModelFromJson(jsonString);

import 'dart:convert';

QuizDetailModel quizDetailModelFromJson(String str) => QuizDetailModel.fromJson(json.decode(str));

String quizDetailModelToJson(QuizDetailModel data) => json.encode(data.toJson());

class QuizDetailModel {
    String? id;
    String? materialId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? title;
    String? description;
    String? type;
    bool? isDone;
    dynamic score;
    Material? material;

    QuizDetailModel({
        this.id,
        this.materialId,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.description,
        this.type,
        this.isDone,
        this.score,
        this.material,
    });

    factory QuizDetailModel.fromJson(Map<String, dynamic> json) => QuizDetailModel(
        id: json["id"],
        materialId: json["material_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        title: json["title"],
        description: json["description"],
        type: json["type"],
        isDone: json["is_done"],
        score: json["score"],
        material: json["material"] == null ? null : Material.fromJson(json["material"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "material_id": materialId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "type": type,
        "is_done": isDone,
        "score": score,
        "material": material?.toJson(),
    };
}

class Material {
    String? id;
    String? teacherId;
    String? title;
    dynamic description;
    String? file;
    String? audio;
    String? qrCode;
    String? arUrl;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fileUrl;
    String? audioUrl;

    Material({
        this.id,
        this.teacherId,
        this.title,
        this.description,
        this.file,
        this.audio,
        this.qrCode,
        this.arUrl,
        this.createdAt,
        this.updatedAt,
        this.fileUrl,
        this.audioUrl,
    });

    factory Material.fromJson(Map<String, dynamic> json) => Material(
        id: json["id"],
        teacherId: json["teacher_id"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
        audio: json["audio"],
        qrCode: json["qr_code"],
        arUrl: json["ar_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fileUrl: json["file_url"],
        audioUrl: json["audio_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "teacher_id": teacherId,
        "title": title,
        "description": description,
        "file": file,
        "audio": audio,
        "qr_code": qrCode,
        "ar_url": arUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "file_url": fileUrl,
        "audio_url": audioUrl,
    };
}
