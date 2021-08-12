import 'package:get/get.dart';
import 'package:simple_api/core/repository/news_repo_imp.dart';
import 'package:simple_api/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImp());
    Get.put(NewsHeadlineController());
  }
}
