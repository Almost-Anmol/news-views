import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(child: ,),
    );
  }
}


class CategoryCards extends StatelessWidget {
  // const CategoryCards ({super.key});
final dynamic imageUrl, categoryName;
const CategoryCards({super.key, this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.network(imageUrl, width: 120, height: 60,),
      ],),
    );
  }
}