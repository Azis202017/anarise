// To parse this JSON data, do
//
//     final profileUserModel = profileUserModelFromJson(jsonString);

import 'dart:convert';

ProfileUserModel profileUserModelFromJson(String str) => ProfileUserModel.fromJson(json.decode(str));

String profileUserModelToJson(ProfileUserModel data) => json.encode(data.toJson());

class ProfileUserModel {
    String? id;
    String? username;
    String? role;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic totalMaterials;
    dynamic totalStudents;
    int? totalEvaluations;
    Student? student;

    ProfileUserModel({
        this.id,
        this.username,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.totalMaterials,
        this.totalStudents,
        this.totalEvaluations,
        this.student,
    });

    factory ProfileUserModel.fromJson(Map<String, dynamic> json) => ProfileUserModel(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        totalMaterials: json["total_materials"],
        totalStudents: json["total_students"],
        totalEvaluations: json["total_evaluations"],
        student: json["student"] == null ? null : Student.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "total_materials": totalMaterials,
        "total_students": totalStudents,
        "total_evaluations": totalEvaluations,
        "student": student?.toJson(),
    };
}

class Student {
    String? id;
    String? userId;
    String? classId;
    String? fullname;
    dynamic photo;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? photoUrl;
    Class? studentClass;
    LearningStyle? learningStyle;

    Student({
        this.id,
        this.userId,
        this.classId,
        this.fullname,
        this.photo,
        this.createdAt,
        this.updatedAt,
        this.photoUrl,
        this.studentClass,
        this.learningStyle,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        userId: json["user_id"],
        classId: json["class_id"],
        fullname: json["fullname"],
        photo: json["photo"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        photoUrl: json["photo_url"],
        studentClass: json["class"] == null ? null : Class.fromJson(json["class"]),
        learningStyle: json["learning_style"] == null ? null : LearningStyle.fromJson(json["learning_style"]),
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
        "class": studentClass?.toJson(),
        "learning_style": learningStyle?.toJson(),
    };
}

class LearningStyle {
    String? id;
    String? name;
    String? description;
    String? label;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? laravelThroughKey;

    LearningStyle({
        this.id,
        this.name,
        this.description,
        this.label,
        this.createdAt,
        this.updatedAt,
        this.laravelThroughKey,
    });

    factory LearningStyle.fromJson(Map<String, dynamic> json) => LearningStyle(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        label: json["label"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        laravelThroughKey: json["laravel_through_key"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "label": label,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "laravel_through_key": laravelThroughKey,
    };
}

class Class {
    String? id;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;

    Class({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
