import 'package:flutter/material.dart';
import 'package:news_views/helper/data.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCategories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Views",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 1.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
            )
          ],
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
                  style: TextStyle(color: Colors.white),
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
      required this.description});

  final String imageUrl, title, description;
  // BlogTile({required this.imageUrl, required this.title, required this.description})

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Image.network(imageUrl), Text(title), Text(description)],
      ),
    );
  }
}
