import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_views/helper/data.dart';
import 'package:news_views/helper/news.dart';
import 'package:news_views/models/article_model.dart';
import 'package:news_views/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> myCategories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCategories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",
                style: TextStyle(
                  color: Colors.blueGrey.shade800,
                )),
            const Text(
              "Views",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 1.0,
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Categories
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          itemCount: myCategories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryCards(
                              imageUrl: myCategories[index].imageUrl,
                              categoryName: myCategories[index].categoryName,
                            );
                          },
                        ),
                      ),

                      // Blogs
                      Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                description: articles[index].description,
                                url: articles[index].url,
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  // const CategoryCards ({super.key});
  final dynamic imageUrl, categoryName;
  const CategoryCards({super.key, this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                // 'imageUrl',
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile(
      {super.key,
      required this.imageUrl, 
      required this.title,
      required this.url,
      required this.description});

  final String imageUrl, title, description, url;
  // BlogTile({required this.imageUrl, required this.title, required this.description})

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
           imag
        )))

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(title,
                style: GoogleFonts.libreFranklin(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold),
                selectionColor: Colors.black54),
            const SizedBox(
              height: 2,
            ),
            Text(
              description,
              style: const TextStyle(),
              selectionColor: Colors.black38,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
        // ],
      ),
    );
  }
}
