// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
    String? id;
    String? quizId;
    String? question;
    String? image;
    String? optionA;
    String? optionB;
    String? optionC;
    String? optionD;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? imageUrl;
    String? selectedAnswer;
    QuestionModel({
        this.id,
        this.quizId,
        this.question,
        this.image,
        this.optionA,
        this.optionB,
        this.optionC,
        this.optionD,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.selectedAnswer
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        quizId: json["quiz_id"],
        question: json["question"],
        image: json["image"],
        optionA: json["option_a"],
        optionB: json["option_b"],
        optionC: json["option_c"],
        optionD: json["option_d"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_id": quizId,
        "question": question,
        "image": image,
        "option_a": optionA,
        "option_b": optionB,
        "option_c": optionC,
        "option_d": optionD,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
    };
}
