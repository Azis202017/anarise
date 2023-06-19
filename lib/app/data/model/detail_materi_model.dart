import 'dart:convert';

DetailMateriModel detailMateriModelFromJson(String str) =>
    DetailMateriModel.fromJson(json.decode(str));

String detailMateriModelToJson(DetailMateriModel data) =>
    json.encode(data.toJson());

class DetailMateriModel {
  String? id;
  String? teacherId;
  String? title;
  String? file;
  String? audio;
  String? qrCode;
  String? arUrl;
   String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileUrl;
  String? audioUrl;
  List<Discussion>? discussion;
  List<FlipCard>? flipCards;
  List<String>? videos;
  Teacher? teacher;

  DetailMateriModel({
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
    this.discussion,
    this.flipCards,
    this.videos,
    this.teacher,
    this.description,
  });

  factory DetailMateriModel.fromJson(Map<String, dynamic> json) =>
      DetailMateriModel(
        id: json["id"],
        description: json['description'],
        teacherId: json["teacher_id"],
        title: json["title"],
        file: json["file"],
        audio: json["audio"],
        qrCode: json["qr_code"],
        arUrl: json["ar_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fileUrl: json["file_url"],
        audioUrl: json["audio_url"],

        discussion: json["discussion"] == null
            ? []
            : List<Discussion>.from(
                json["discussion"]!.map((x) => Discussion.fromJson(x))),
        flipCards: json["flip_cards"] == null
            ? []
            : List<FlipCard>.from(
                json["flip_cards"]!.map((x) => FlipCard.fromJson(x))),
        videos: json["videos"] == null
            ? []
            : List<String>.from(json["videos"]!.map((x) => x)),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
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
        "discussion": discussion == null
            ? []
            : List<dynamic>.from(discussion!.map((x) => x.toJson())),
        "flip_cards": flipCards == null
            ? []
            : List<dynamic>.from(flipCards!.map((x) => x.toJson())),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "teacher": teacher?.toJson(),
      };
}

class Discussion {
  String? id;
  String? materialId;
  String? teacherId;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  Discussion({
    this.id,
    this.materialId,
    this.teacherId,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json["id"],
        materialId: json["material_id"],
        teacherId: json["teacher_id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class FlipCard {
  String? id;
  String? materialId;
  String? front;
  String? back;
  DateTime? createdAt;
  DateTime? updatedAt;

  FlipCard({
    this.id,
    this.materialId,
    this.front,
    this.back,
    this.createdAt,
    this.updatedAt,
  });

  factory FlipCard.fromJson(Map<String, dynamic> json) => FlipCard(
        id: json["id"],
        materialId: json["material_id"],
        front: json["front"],
        back: json["back"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class Teacher {
  String? id;
  String? userId;
  String? classId;
  String? fullname;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? photoUrl;

  Teacher({
    this.id,
    this.userId,
    this.classId,
    this.fullname,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.photoUrl,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        userId: json["user_id"],
        classId: json["class_id"],
        fullname: json["fullname"],
        photo: json["photo"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "class_id": classId,
        "fullname": fullname,
        "photo": photo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "photo_url": photoUrl,
      };
}
