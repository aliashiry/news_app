import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<NewsModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=7e972317ca474537b6e8487e3aa933a2&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<NewsModel> articlesList = [];
      for (var articel in articles) {
        NewsModel articelModel = NewsModel.fromJson(articel);
        articlesList.add(articelModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
