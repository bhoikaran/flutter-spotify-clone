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
               overflow: TextOverflow.ellipsis, // Adds ellipsis (...) if text overflows
              maxLines: 1, // Ensures the text is displayed in a single line
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

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(
              music.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOprations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 285,
      child: GridView.count(
        childAspectRatio: 6 / 2,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: creaListOfCategories(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
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
            createGrid(),
            createMusicList('Made for you'),
            createMusicList('Popular Playlist'),
          ],
        ),
      )),
    );
  }
}
