import 'package:get/get.dart';
import 'package:simple_api/core/models/article.dart';
import 'package:simple_api/core/models/news_response_model.dart';
import 'package:simple_api/core/repository/news_repo.dart';
import 'package:simple_api/services/http_service.dart';
import 'package:simple_api/services/http_service_imp.dart';

class NewsRepoImp implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImp() {
    _httpService = Get.put(HttpServiceImp());
    _httpService.init();
  }

  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("v2/top-headlines?country=us");

      final parsedResponse = NewsReponse.fromJson(response.data);
      return parsedResponse.totalArticles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchNews(String query) async {
    try {
      final response = await _httpService.getRequest("v2/everything?q=$query");

      final parsedReponse = NewsReponse.fromJson(response.data);

      return parsedReponse.totalArticles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
