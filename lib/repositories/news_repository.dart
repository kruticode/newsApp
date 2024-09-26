import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

    var data = jsonDecode(response.body);

    List<ArticleModel> articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel artcileModel = ArticleModel.fromJson(item);
        articleModelList.add(artcileModel);
      }
      return articleModelList;
    } else {
      return articleModelList; // empty list
    }
  }
}
