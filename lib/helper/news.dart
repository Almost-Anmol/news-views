import 'dart:convert';
import 'package:news_views/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=8ea356c797bb4090b4596e40baef64ec");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          if (element["url"] != null && element["title"] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'.toString()],
              // author: element['author'],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              // content: element["context"]
            );
            news.add(articleModel);
          }
        }
      });
    }
  }
}
