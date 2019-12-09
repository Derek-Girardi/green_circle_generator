// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

class Questions {
    List<Question> questions;

    Questions({
        this.questions,
    });

    factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    String textQuestion;
    String difficulty;

    Question({
        this.textQuestion,
        this.difficulty,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        textQuestion: json["textQuestion"],
        difficulty: json["difficulty"],
    );

    Map<String, dynamic> toJson() => {
        "textQuestion": textQuestion,
        "difficulty": difficulty,
    };
}
