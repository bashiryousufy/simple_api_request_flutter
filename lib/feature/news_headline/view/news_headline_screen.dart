import 'package:flutter/material.dart';
import 'package:simple_api/core/widget/drawer.dart';

class NewsHeadLineView extends StatelessWidget {
  const NewsHeadLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headline'),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}
