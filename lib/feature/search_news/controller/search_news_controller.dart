import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_api/core/models/article.dart';
import 'package:simple_api/core/repository/news_repo.dart';
import 'package:simple_api/core/repository/news_repo_imp.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImp>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getSearchNews(searchTextController.text);

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
