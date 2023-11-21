import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/news_tile.dart';

class NewsListView extends StatelessWidget {

 final List<NewsModel> articels;

  const NewsListView({super.key,required this.articels});
  @override
  Widget build(BuildContext context) {
    return  SliverList(
            delegate: SliverChildBuilderDelegate(childCount: articels.length,
                (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: NewsTile(
                newsitem: articels[index],
              ),
            );
          }));
  }
}
