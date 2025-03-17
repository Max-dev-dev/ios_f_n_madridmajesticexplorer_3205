// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class QuizResponse with _$QuizResponse {
  const factory QuizResponse({
    @JsonKey(name: 'quiz') required List<QuizItem> quiz,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);
}

@freezed
class QuizItem with _$QuizItem {
  const factory QuizItem({
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'answer_a') required String answerA,
    @JsonKey(name: 'answer_b') required String answerB,
    @JsonKey(name: 'answer_c') required String answerC,
    @JsonKey(name: 'answer_d') required String answerD,
    @JsonKey(name: 'right_answer') required String rightAnswer,
  }) = _QuizItem;

  factory QuizItem.fromJson(Map<String, dynamic> json) =>
      _$QuizItemFromJson(json);
}

extension QuizItemExtension on QuizItem {
  String getAnswerText(String answerKey) {
    return {
          "A": answerA,
          "B": answerB,
          "C": answerC,
          "D": answerD,
        }[answerKey] ??
        "N/A";
  }
}
