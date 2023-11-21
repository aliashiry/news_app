import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future=  NewsService(Dio()).getTopHeadlines(
      category: widget.category
    );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<NewsModel>>(
        future:future,
        // ignore: non_constant_identifier_names
        builder: (context, Snapshot) {
          if(Snapshot.hasData) {
            return NewsListView(articels: Snapshot.data!);
          } else if (Snapshot.hasError){
           return  const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('oops there was an error , try later'),),
          );
          }else{
            return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator())
          );
          }
        });
  }
}
