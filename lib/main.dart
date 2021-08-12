import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_api/feature/news_headline/binding/news_headline_binding.dart';
import 'package:simple_api/feature/news_headline/view/news_headline_screen.dart';
import 'package:simple_api/feature/search_news/binding/search_news_binding.dart';
import 'package:simple_api/feature/search_news/view/search_news_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      getPages: [
        GetPage(
          name: "/news_headline",
          page: () => NewsHeadLineView(),
          binding: NewsHeadlineBinding(),
        ),
        GetPage(
          name: "/search_news",
          page: () => SearchNewsView(),
          binding: SearchNewsBinding(),
        )
      ],
      initialRoute: "/news_headline",
    );
  }
}
