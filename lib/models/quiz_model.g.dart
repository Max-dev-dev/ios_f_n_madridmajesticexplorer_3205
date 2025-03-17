// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResponseImpl _$$QuizResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuizResponseImpl(
      quiz:
          (json['quiz'] as List<dynamic>)
              .map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$QuizResponseImplToJson(_$QuizResponseImpl instance) =>
    <String, dynamic>{'quiz': instance.quiz};

_$QuizItemImpl _$$QuizItemImplFromJson(Map<String, dynamic> json) =>
    _$QuizItemImpl(
      image: json['image'] as String,
      question: json['question'] as String,
      answerA: json['answer_a'] as String,
      answerB: json['answer_b'] as String,
      answerC: json['answer_c'] as String,
      answerD: json['answer_d'] as String,
      rightAnswer: json['right_answer'] as String,
    );

Map<String, dynamic> _$$QuizItemImplToJson(_$QuizItemImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'question': instance.question,
      'answer_a': instance.answerA,
      'answer_b': instance.answerB,
      'answer_c': instance.answerC,
      'answer_d': instance.answerD,
      'right_answer': instance.rightAnswer,
    };
