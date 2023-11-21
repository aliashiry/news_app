class NewsModel {
  final String? image;
  final String text;
  final String? subtext;
  final String url;
  NewsModel({required this.url, required this.image, required this.text, required this.subtext});
  factory NewsModel.fromJson(json) {
    return NewsModel(
      image:json['urlToImage'],
      text:json['title'],
      subtext:json['description'],
      url:json['url'],

    );
  }
}
