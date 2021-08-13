import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article();

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "urlToImage")
  String? imageURL;

  @JsonKey(name: "url")
  String? newsURL;

  @JsonKey(name: "content")
  String? content;

  @JsonKey(name: "publishedAt")
  late String publishedAt;

  DateTime get getPublishedAtDate => DateTime.parse(publishedAt);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
