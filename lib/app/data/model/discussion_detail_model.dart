// To parse this JSON data, do
//
//     final discussionDetailModel = discussionDetailModelFromJson(jsonString);

import 'dart:convert';

DiscussionDetailModel discussionDetailModelFromJson(String str) => DiscussionDetailModel.fromJson(json.decode(str));

String discussionDetailModelToJson(DiscussionDetailModel data) => json.encode(data.toJson());

class DiscussionDetailModel {
    String? id;
    String? materialId;
    String? teacherId;
    String? title;
    String? content;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Reply>? replies;
    Teacher? teacher;
    Material? material;

    DiscussionDetailModel({
        this.id,
        this.materialId,
        this.teacherId,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.replies,
        this.teacher,
        this.material,
    });

    factory DiscussionDetailModel.fromJson(Map<String, dynamic> json) => DiscussionDetailModel(
        id: json["id"],
        materialId: json["material_id"],
        teacherId: json["teacher_id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        replies: json["replies"] == null ? [] : List<Reply>.from(json["replies"]!.map((x) => Reply.fromJson(x))),
        teacher: json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
        material: json["material"] == null ? null : Material.fromJson(json["material"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "material_id": materialId,
        "teacher_id": teacherId,
        "title": title,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
        "teacher": teacher?.toJson(),
        "material": material?.toJson(),
    };
}

class Material {
    String? id;
    String? teacherId;
    String? title;
    String? description;
    String? file;
    String? audio;
    String? qrCode;
    String? arUrl;
    String? puzzleUrl;
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
        this.puzzleUrl,
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
        puzzleUrl: json["puzzle_url"],
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
        "puzzle_url": puzzleUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "file_url": fileUrl,
        "audio_url": audioUrl,
    };
}

class Reply {
    String? id;
    String? discussionId;
    String? studentId;
    String? title;
    String? content;
    String? teacherReply;
    int? isReplied;
    DateTime? createdAt;
    DateTime? updatedAt;
    Teacher? student;

    Reply({
        this.id,
        this.discussionId,
        this.studentId,
        this.title,
        this.content,
        this.teacherReply,
        this.isReplied,
        this.createdAt,
        this.updatedAt,
        this.student,
    });

    factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        discussionId: json["discussion_id"],
        studentId: json["student_id"],
        title: json["title"],
        content: json["content"],
        teacherReply: json["teacher_reply"],
        isReplied: json["is_replied"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        student: json["student"] == null ? null : Teacher.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "discussion_id": discussionId,
        "student_id": studentId,
        "title": title,
        "content": content,
        "teacher_reply": teacherReply,
        "is_replied": isReplied,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "student": student?.toJson(),
    };
}

class Teacher {
    String? id;
    String? userId;
    String? classId;
    String? fullname;
    dynamic photo;
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
