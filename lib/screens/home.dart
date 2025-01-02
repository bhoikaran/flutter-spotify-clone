import 'package:flutter/material.dart';
import 'package:spotify/models/Category.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/services/Category_oprations.dart';
import 'package:spotify/services/music_oprations.dart';

class Home extends StatelessWidget {
  


Function _miniPlayer;

 Home(this._miniPlayer);

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
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow
                  .ellipsis, // Adds ellipsis (...) if text overflows
              maxLines: 2, // Ensures the text is displayed in a single line
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: 200,
              width: 200,
              child: InkWell(
                onTap: (){
                    _miniPlayer(music);
                },
                child: Image.network(
                  music.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              music.name,
              style: TextStyle(color: Colors.white),
               overflow: TextOverflow
                  .ellipsis, 
              maxLines: 2,
            ),
          ),
          Flexible(
            child: Text(
              music.desc,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow
                  .ellipsis, // Adds ellipsis (...) if text overflows
              maxLines: 2, // Ensures the text is displayed in a single line
            ),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOprations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
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
