import 'package:simple_api/core/models/article.dart';

import '../models/article.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadline();
  Future<List<Article>?> getSearchNews(String query);
}
