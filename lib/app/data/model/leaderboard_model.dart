
import 'dart:convert';

Leaderboard leaderboardFromJson(String str) => Leaderboard.fromJson(json.decode(str));

String leaderboardToJson(Leaderboard data) => json.encode(data.toJson());

class Leaderboard {
    String? id;
    String? studentId;
    String? quizId;
    int? score;
    int? isDone;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? rank;
    Student? student;
    Quiz? quiz;

    Leaderboard({
        this.id,
        this.studentId,
        this.quizId,
        this.score,
        this.isDone,
        this.createdAt,
        this.updatedAt,
        this.rank,
        this.student,
        this.quiz,
    });

    factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        id: json["id"],
        studentId: json["student_id"],
        quizId: json["quiz_id"],
        score: json["score"],
        isDone: json["is_done"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        rank: json["rank"],
        student: json["student"] == null ? null : Student.fromJson(json["student"]),
        quiz: json["quiz"] == null ? null : Quiz.fromJson(json["quiz"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "quiz_id": quizId,
        "score": score,
        "is_done": isDone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rank": rank,
        "student": student?.toJson(),
        "quiz": quiz?.toJson(),
    };
}

class Quiz {
    String? id;
    String? materialId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? title;
    String? description;
    String? type;
    bool? isDone;
    int? score;

    Quiz({
        this.id,
        this.materialId,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.description,
        this.type,
        this.isDone,
        this.score,
    });

    factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        materialId: json["material_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        title: json["title"],
        description: json["description"],
        type: json["type"],
        isDone: json["is_done"],
        score: json["score"],
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

    Student({
        this.id,
        this.userId,
        this.classId,
        this.fullname,
        this.photo,
        this.createdAt,
        this.updatedAt,
        this.photoUrl,
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
