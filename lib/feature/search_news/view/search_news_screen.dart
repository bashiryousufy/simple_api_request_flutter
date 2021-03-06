import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_api/core/widget/drawer.dart';
import 'package:simple_api/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.articles.isEmpty
                    ? Center(
                        child: Text("No News Found"),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(controller
                                          .articles[index].imageURL ??
                                      "https://fpae.pt/backup/20181025/wp/wp-content/plugins/post-slider-carousel/images/no-image-available.jpg"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.articles[index].title ??
                                        "No Title Found!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(controller.articles[index].description ??
                                      "No Description Found!"),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: controller.articles.length),
                      );
          }))
        ],
      ),
    );
  }
}
