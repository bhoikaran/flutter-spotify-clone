import 'package:flutter/material.dart';
import 'package:spotify/models/Category.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/services/Category_oprations.dart';
import 'package:spotify/services/music_oprations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget createAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      foregroundColor: Colors.white,
      title: Text("Good Morning"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade300,
      child: Row(
        children: [
          Image.network(
            category.imageUrl,
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> creaListOfCategories() {
    List<Category> categoryList = CategoryOprations.getCategories();

    //convert data to widget using map function

    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();

    return categories;
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOprations.getMusic();
    return ListView.builder(
      itemBuilder: (context, index) {},
      itemCount: musicList.length,
    );

  }

  Widget createGrid() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 350,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: creaListOfCategories(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blueGrey.shade300,
        Colors.black,
        Colors.black,
        Colors.black
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        children: [
          createAppbar(),
          SizedBox(
            height: 5,
          ),
          createGrid()
        ],
      ),
    );
  }
}
