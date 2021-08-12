import 'package:json_annotation/json_annotation.dart';
import 'package:simple_api/core/models/article.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsReponse {
  NewsReponse();
  @JsonKey(name: 'status')
  late String status;

  @JsonKey(name: 'totalResults')
  late String totalResults;

  @JsonKey(name: 'articles')
  late List<Article> totalArticles;

  factory NewsReponse.fromJson(Map<String, dynamic> json) =>
      _$NewsReponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsReponseToJson(this);
}
