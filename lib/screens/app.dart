import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/yourlibrary.dart';
import 'package:audioplayers/audioplayers.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String audioset = "assets/";
  final AudioPlayer _audioPlayer = new AudioPlayer();

  var Tabs = [];
  Music? music;
  int currentTabIndex = 0;
  bool isPlaying = false;
//  Widget miniPlayer(Music? music, {bool stop =  false}){

  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    if (music == null) {
      return SizedBox();
    }

    if (stop) {
      isPlaying = false;
      _audioPlayer.stop(); // Corrected function call
    }else {
      //  isPlaying = true;
      //      _audioPlayer
      //               .play(UrlSource(music.audioUrl)); // Start playing
    }
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      color: Colors.blueGrey,
      height: 50,
      width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          //   IconButton(
          //       // ignore: void_checks
          //       onPressed: () async {

          //         isPlaying = !isPlaying;
          //         if (isPlaying) {
          //           await _audioPlayer.play(UrlSource(music.audioUrl));

          //         } else {
          //           await _audioPlayer.pause();
          //         }
          //       },
          //       icon: isPlaying
          //           ? Icon(
          //               Icons.pause,
          //               color: Colors.white,
          //             )
          //           : Icon(
          //               Icons.play_arrow,
          //               color: Colors.white,
          //             ))

          IconButton(
            onPressed: () async {
              if (isPlaying) {
                await _audioPlayer.pause(); // Pause playback
              } else {
                await _audioPlayer
                    .play(UrlSource(music.audioUrl)); // Start playing
              }

              setState(() {
                isPlaying = !isPlaying; // Toggle the isPlaying state
              });
            },
            icon: isPlaying
                ? Icon(Icons.pause, color: Colors.white)
                : Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          new BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                print("The Current Index is $currentIndex");
                currentTabIndex = currentIndex;
                setState(() {});
              },
              backgroundColor: Colors.black45,
              selectedLabelStyle: TextStyle(color: Colors.white),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    label: "Library"),
              ]),
        ],
      ),
    );
  }
}
