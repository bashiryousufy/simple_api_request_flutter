// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsReponse _$NewsReponseFromJson(Map<String, dynamic> json) {
  return NewsReponse()
    ..status = json['status'] as String
    ..totalResults = json['totalResults'] as String
    ..totalArticles = (json['articles'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$NewsReponseToJson(NewsReponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.totalArticles,
    };
