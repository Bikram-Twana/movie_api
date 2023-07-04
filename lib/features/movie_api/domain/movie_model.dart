import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  final int? responseCode;
  final List<Result>? results;

  MovieModel({
    this.responseCode,
    this.results,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        responseCode: json["response_code"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  final String? category;
  final String? type;
  final String? difficulty;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;

  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"]!,
        type: json["type"]!,
        difficulty: json["difficulty"]!,
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: json["incorrect_answers"] == null
            ? []
            : List<String>.from(json["incorrect_answers"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": incorrectAnswers == null
            ? []
            : List<String>.from(incorrectAnswers!.map((x) => x)),
      };
}
