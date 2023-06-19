import 'dart:convert';

MaterialModel materialModelFromJson(String str) => MaterialModel.fromJson(json.decode(str));

String materialModelToJson(MaterialModel data) => json.encode(data.toJson());

class MaterialModel {
    String? id;
    String? teacherId;
    String? title;
    String? file;
    String? audio;
    String? qrCode;
    String? arUrl;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fileUrl;
    String? audioUrl;

    MaterialModel({
        this.id,
        this.teacherId,
        this.title,
        this.file,
        this.audio,
        this.qrCode,
        this.arUrl,
        this.createdAt,
        this.updatedAt,
        this.fileUrl,
        this.audioUrl,
    });

    factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
        id: json["id"],
        teacherId: json["teacher_id"],
        title: json["title"],
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
