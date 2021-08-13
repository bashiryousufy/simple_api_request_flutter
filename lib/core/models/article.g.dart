// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article()
    ..author = json['author'] as String
    ..description = json['description'] as String?
    ..title = json['title'] as String
    ..imageURL = json['urlToImage'] as String?
    ..newsURL = json['url'] as String?
    ..content = json['content'] as String?
    ..publishedAt = json['publishedAt'] as String;
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'description': instance.description,
      'title': instance.title,
      'urlToImage': instance.imageURL,
      'url': instance.newsURL,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
    };
