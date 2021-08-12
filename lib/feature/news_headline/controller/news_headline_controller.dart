import 'package:get/get.dart';
import 'package:simple_api/core/models/article.dart';
import 'package:simple_api/core/repository/news_repo.dart';
import 'package:simple_api/core/repository/news_repo_imp.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImp>();
    loadNewsHeadline();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No Data Recieved!");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
