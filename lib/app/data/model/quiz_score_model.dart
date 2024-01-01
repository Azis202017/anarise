// To parse this JSON data, do
//
//     final quizScore = quizScoreFromJson(jsonString);

import 'dart:convert';

QuizScore quizScoreFromJson(String str) => QuizScore.fromJson(json.decode(str));

String quizScoreToJson(QuizScore data) => json.encode(data.toJson());

class QuizScore {
    double? score;
    String? message;

    QuizScore({
        this.score,
        this.message,
    });

    factory QuizScore.fromJson(Map<String, dynamic> json) => QuizScore(
        score: json["score"]?.toDouble(),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "score": score,
        "message": message,
    };
}
