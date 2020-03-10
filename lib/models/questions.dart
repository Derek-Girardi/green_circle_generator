// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

class Questions {
    List<Question> easyQuestions;
    List<Question> mediumQuestions;
    List<Question> hardQuestions;

    Questions({
        this.easyQuestions,
        this.mediumQuestions,
        this.hardQuestions,
    });

    factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        easyQuestions: List<Question>.from(json["easyQuestions"].map((x) => Question.fromJson(x))),
        mediumQuestions: List<Question>.from(json["mediumQuestions"].map((x) => Question.fromJson(x))),
        hardQuestions: List<Question>.from(json["hardQuestions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "easyQuestions": List<dynamic>.from(easyQuestions.map((x) => x.toJson())),
        "mediumQuestions": List<dynamic>.from(mediumQuestions.map((x) => x.toJson())),
        "hardQuestions": List<dynamic>.from(hardQuestions.map((x) => x.toJson())),
    };
}

class Question {
    String textQuestion;

    Question({
        this.textQuestion,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        textQuestion: json["textQuestion"],
    );

    Map<String, dynamic> toJson() => {
        "textQuestion": textQuestion,
    };
}
